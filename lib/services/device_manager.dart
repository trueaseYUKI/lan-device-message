import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../utils/device_info_utils.dart';
import 'lan_register_service.dart';
import 'lan_discovery_service.dart';
import 'ws_server_manager.dart';
import 'ws_client_manager.dart';
import '../models/lan_device.dart';
import '../protos/message.pb.dart' as proto;

class DeviceManager {
  static const String serviceType = '_lanmsg._tcp';
  static const int websocketPort = 9050;

  late LANRegisterService _registerService;
  late LANDiscoveryService _discoveryService;
  late WebSocketServerManager _serverManager;
  late WebSocketClientManager _clientManager;
  late String _myDeviceId;
  late String _myDeviceName;

  void Function(LANDevice device)? onDeviceFound;
  void Function(LANDevice device)? onDeviceLost;
  void Function(proto.Envelope env, String connectionInfo)? onMessageReceived;


  /// 初始化信息
  Future<void> init() async {
    // 获取设备信息
    final deviceInfo = await DeviceInfoUtils.getOrCreateDeviceInfo();
    _myDeviceId = deviceInfo['deviceId']!;
    _myDeviceName = deviceInfo['deviceName']!;

    // 初始化服务
    _registerService = LANRegisterService(serviceType: serviceType);
    _serverManager = WebSocketServerManager(
      onMessage: (env, clientInfo) {
        // 收到消息使用消息接收方法处理消息
        onMessageReceived?.call(env, clientInfo);
      },
    );
    _clientManager = WebSocketClientManager(
      onPeerMessage: (env, connectionInfo) {
        onMessageReceived?.call(env, connectionInfo);
      },
    );

    // 创建发现服务，并设置回调
    _discoveryService = LANDiscoveryService(
      serviceType: serviceType,
      myDeviceId: _myDeviceId,
      onServiceFound: (device) {
        // 当发现新设备时，调用 onDeviceFound 回调
        onDeviceFound?.call(device);
      },
      onServiceLost: (device) {
        // 当设备下线时，调用 onDeviceLost 回调
        onDeviceLost?.call(device);
      },
    );
  }

  /// 开启所有服务
  Future<void> startServices() async {
    // 注册mDNS服务
    await _registerService.registerService(
      deviceId: _myDeviceId,
      name: _myDeviceName,
      port: websocketPort,
    );

    // 启动WebSocket服务端
    await _serverManager.startServer(
      port: websocketPort,
      serverName: '$_myDeviceName Server',
      ip: await _getLocalIp(),
    );

    // 启动mDNS服务发现
    await _discoveryService.start();
  }

  /// 停止所有服务
  Future<void> stopServices() async {
    await _discoveryService.stop();
    await _registerService.unregisterService();
    await _serverManager.stopAll();
    await _clientManager.disconnectAll();
  }

  /// 服务器消息广播
  void broadcastMessage(proto.Envelope envelope) {
    _serverManager.broadcast(envelope);
  }

  // 在 DeviceManager 类中添加获取IP地址的方法
  Future<String> _getLocalIp() async {
    try {
      final interfaces = await NetworkInterface.list(
        includeLoopback: false,
        type: InternetAddressType.IPv4,
      );
      for (final iface in interfaces) {
        for (final addr in iface.addresses) {
          if (addr.address.startsWith('192.168.') ||
              addr.address.startsWith('10.') ||
              addr.address.startsWith('172.')) {
            return addr.address;
          }
        }
      }
    } catch (e) {
      print("[deviceManager]⚠️ 获取本机IP失败：$e");
    }
    return '0.0.0.0';
  }

  Future<void> connectToDevice(LANDevice device) async {
    await _clientManager.connect(device.ip, device.port, device.name);
  }

  void send(String ip, int port, proto.Envelope envelope) {
    _clientManager.send(ip, port, envelope);
  }
}

final deviceManagerProvider = Provider<DeviceManager>((ref) {
  return DeviceManager();
});
