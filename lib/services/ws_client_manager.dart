import 'dart:async';
import 'dart:io';
import '../protos/message.pb.dart' as proto;

typedef OnPeerMessage =
    void Function(proto.Envelope env, String connectionInfo);

class WebSocketClientManager {
  final Map<String, WebSocket> _sockets = {};
  final Map<String, String> _connectionNames = {}; // 添加连接名称映射
  final OnPeerMessage onPeerMessage;

  WebSocketClientManager({required this.onPeerMessage});

  String _key(String host, int port) => '$host:$port';

  bool isConnected(String host, int port) {
    final s = _sockets[_key(host, port)];
    return s != null && s.readyState == WebSocket.open;
  }

  Future<void> connect(String host, int port, [String? deviceName]) async {
    final key = _key(host, port);
    if (isConnected(host, port)) return;

    try {
      final ws = await WebSocket.connect('ws://$host:$port');
      _sockets[key] = ws;

      // 记录连接名称
      if (deviceName != null) {
        _connectionNames[key] = deviceName;
      }

      final isLocal = host == '127.0.0.1' || host == '::1';
      final connectionInfo =
          '$host:$port${isLocal ? " (本地)" : " (远程)"}${deviceName != null ? " [$deviceName]" : ""}';

      ws.listen(
        (data) {
          try {
            if (data is List<int>) {
              final env = proto.Envelope.fromBuffer(data);
              print(
                "[客户端接收] $connectionInfo <- ${env.sender.nickname} (${env.sender.deviceId}): ${env.hasText() ? env.text.content : '非文本消息'}",
              );
              onPeerMessage(env, connectionInfo);
            }
          } catch (e) {
            print("[客户端接收失败] 消息解析失败: $e (连接: $connectionInfo)");
          }
        },
        onDone: () {
          print("[客户端断开] 连接已关闭: $connectionInfo");
          _sockets.remove(key);
          _connectionNames.remove(key);
        },
        onError: (e) {
          print("[客户端错误] $connectionInfo: $e");
          _sockets.remove(key);
          _connectionNames.remove(key);
        },
      );
      print("[客户端连接] 已建立 WebSocket 连接: $connectionInfo");
    } catch (e) {
      print("[客户端连接失败] $host:$port -> $e");
    }
  }

  Future<void> send(String host, int port, proto.Envelope env) async {
    final key = _key(host, port);
    final s = _sockets[key];
    if (s != null && s.readyState == WebSocket.open) {
      s.add(env.writeToBuffer());
      final connectionName = _connectionNames[key] ?? '$host:$port';
      print(
        "[客户端发送] 发送给 $connectionName -> ${env.hasText() ? env.text.content : '非文本消息'}",
      );
    }
  }

  Future<void> broadcast(proto.Envelope env) async {
    int connectionCount = 0;
    for (final entry in _sockets.entries) {
      final key = entry.key;
      final ws = entry.value;
      try {
        if (ws.readyState == WebSocket.open) {
          ws.add(env.writeToBuffer());
          connectionCount++;
        }
      } catch (e) {
        print("[客户端广播错误] 发送给 $key: $e");
      }
    }
    print(
      "[客户端广播] 内容: ${env.hasText() ? env.text.content : '非文本消息'} <- 来自 ${env.sender.nickname} -> 共发送给 $connectionCount 个连接",
    );
  }

  Future<void> disconnectAll() async {
    for (final s in _sockets.values) {
      try {
        await s.close();
      } catch (_) {}
    }
    _sockets.clear();
    _connectionNames.clear();
    print("[客户端断开] 已断开所有连接");
  }
}
