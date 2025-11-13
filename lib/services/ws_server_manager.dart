import 'dart:io';
import '../protos/message.pb.dart' as proto;

typedef OnMessage = void Function(proto.Envelope env, String clientInfo);

class WebSocketServerManager {
  // 存储当前所有正在运行的ws服务器的实例
  final Map<String, HttpServer> _servers =
      {}; // 存储所有正在运行的 WebSocket 服务器实例，键为 IP:端口 组合
  final Map<String, List<WebSocket>> _clients =
      {}; // 存储每个 IP:端口 上连接的所有客户端 WebSocket 连接 （即每个设备的服务端连接哪些客户端）
  final Map<WebSocket, String> _clientInfo = {}; // 添加客户端信息映射（每个客户端上的设备信息）
  final OnMessage onMessage;
  // key为 IP:端口 组合
  final Map<String, String> _serverNames = {}; // 添加服务器名称映射

  WebSocketServerManager({required this.onMessage});

  /// 生成服务器 key (IP:端口)
  String _serverKey(String ip, int port) => '$ip:$port';

  Future<void> startServer({
    required int port,
    String? serverName,
    required String ip,
  }) async {
    final key = _serverKey(ip, port);
    if (_servers.containsKey(key)) return;

    final server = await HttpServer.bind(InternetAddress(ip), port);
    _servers[key] = server;
    _clients[key] = [];

    if (serverName != null) {
      _serverNames[key] = serverName;
    }

    server.listen((req) async {
      if (WebSocketTransformer.isUpgradeRequest(req)) {
        final ws = await WebSocketTransformer.upgrade(req);
        _clients[key]!.add(ws);

        // 获取客户端信息
        final clientAddress =
            req.connectionInfo?.remoteAddress.address ?? 'unknown';
        final clientPort = req.connectionInfo?.remotePort ?? 0;
        final isLocal = clientAddress == '127.0.0.1' || clientAddress == '::1';
        final clientInfo =
            '$clientAddress:$clientPort${isLocal ? " (本地)" : " (远程)"}';
        _clientInfo[ws] = clientInfo;

        print(
          "[服务器] ${_serverNames[key] ?? "IP $ip 端口$port"} 接受客户端连接: $clientInfo",
        );

        ws.listen(
          (data) {
            try {
              if (data is List<int>) {
                final env = proto.Envelope.fromBuffer(data);
                print(
                  "[服务器接收] ${_serverNames[key] ?? "IP $ip 端口$port"} <- ${env.sender.nickname} (${env.sender.deviceId}): ${env.hasText() ? env.text.content : '非文本消息'} (来自: $clientInfo)",
                );
                onMessage(env, clientInfo);
              }
            } catch (e) {
              print("[服务器解析失败] ${_serverNames[key] ?? "IP $ip 端口$port"}: $e");
            }
          },
          onDone: () {
            print("[服务器] 客户端断开连接: ${_clientInfo[ws] ?? 'unknown'}");
            _clientInfo.remove(ws);
            _clients[key]!.remove(ws);
          },
          onError: (e) {
            print(
              "[服务器错误] ${_serverNames[key] ?? "IP $ip 端口$port"}: $e (客户端: ${_clientInfo[ws] ?? 'unknown'})",
            );
            _clientInfo.remove(ws);
            _clients[key]!.remove(ws);
          },
        );
        print(
          "[服务器] ${_serverNames[key] ?? "IP $ip 端口$port"} <- 客户端已连接: $clientInfo",
        );
      } else {
        req.response.statusCode = HttpStatus.forbidden;
        await req.response.close();
      }
    });
    print(
      "[服务器启动] ${serverName != null ? '$serverName ' : ''}IP $ip 端口 $port 已启动 WebSocket 服务器",
    );
  }

  Future<void> broadcast(proto.Envelope env) async {
    final data = env.writeToBuffer();
    int clientCount = 0;
    for (final ws in _clients.values.expand((x) => x)) {
      try {
        if (ws.readyState == WebSocket.open) {
          ws.add(data);
          clientCount++;
        }
      } catch (e) {
        print("[服务器广播错误] 发送给 ${_clientInfo[ws] ?? 'unknown'}: $e");
      }
    }
    print(
      "[服务器广播] 内容: ${env.hasText() ? env.text.content : '非文本消息'} <- 来自 ${env.sender.nickname} -> 共发送给 $clientCount 个客户端",
    );
  }

  Future<void> stopAll() async {
    for (final s in _servers.values) {
      await s.close();
    }
    _servers.clear();
    _clients.clear();
    _clientInfo.clear();
    _serverNames.clear();
    print("[服务器关闭] 已关闭所有 WebSocket 服务器");
  }
}
