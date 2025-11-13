import 'package:nsd/nsd.dart';
import '../models/lan_device.dart';
import 'dart:io';

class LANDiscoveryService {
  final String serviceType;
  final String myDeviceId;
  final void Function(LANDevice device)? onServiceFound;
  final void Function(LANDevice device)? onServiceLost;

  Discovery? _discovery;
  final List<String> _knownDeviceIds = [];

  LANDiscoveryService({
    required this.serviceType,
    required this.myDeviceId,
    this.onServiceFound,
    this.onServiceLost,
  });

  // 获取本机局域网IP地址
  Future<String?> _getLocalIp() async {
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
      print("⚠️ 获取本机IP失败：$e");
    }
    return null;
  }

  Future<String> _resolveHostnameToIP(String hostname) async {
    try {
      final addresses = await InternetAddress.lookup(hostname);
      if (addresses.isNotEmpty) {
        return addresses.first.address;
      }
    } catch (e) {
      print("❌ 解析主机名失败：$hostname, 错误：$e");
    }
    return hostname;
  }

  /// 启动发现服务（诊断模式）
  Future<void> start() async {
    final ip = await _getLocalIp();
    print("🔍 启动局域网发现：$serviceType");
    print("🆔 本机设备ID：$myDeviceId");
    print("🌐 本机IP：${ip ?? '未知'}");

    try {
      _discovery = await startDiscovery(
        serviceType,
        autoResolve: true,
        ipLookupType: IpLookupType.any,
      );
      print("✅ 成功启动 mDNS 服务发现");
    } catch (e) {
      print("❌ 启动 mDNS 失败，错误：$e");
      return;
    }

    _discovery!.addListener(() async {
      final services = _discovery!.services;
      print("📡 当前发现到 ${services.length} 个服务：");

      for (final s in services) {
        final foundDeviceId = String.fromCharCodes(s.txt?['deviceId'] ?? []);
        if (foundDeviceId.isEmpty) continue;

        // 本机自己跳过
        if (foundDeviceId == myDeviceId) {
          print("⛔ 跳过本机：${s.name}");
          continue;
        }

        // 新设备
        if (!_knownDeviceIds.contains(foundDeviceId)) {
          _knownDeviceIds.add(foundDeviceId);
          final resolvedIP = await _resolveHostnameToIP(s.host ?? 'unknown');
          print("➡️ 新设备发现：${s.name} ($resolvedIP:${s.port})");

          final device = LANDevice(
            deviceId: foundDeviceId,
            deviceType: String.fromCharCodes(s.txt?['deviceType'] ?? []),
            name: s.name ?? '未知设备',
            ip: resolvedIP,
            port: s.port ?? 0,
            avatarUrl: s.txt?['avatarUrl'] != null
                ? String.fromCharCodes(s.txt!['avatarUrl']!)
                : null,
          );

          onServiceFound?.call(device);
        }
      }

      // 检查设备下线
      final currentIds = services
          .map((s) => String.fromCharCodes(s.txt?['deviceId'] ?? []))
          .where((id) => id.isNotEmpty && id != myDeviceId)
          .toList();

      final removedIds = _knownDeviceIds
          .where((id) => !currentIds.contains(id))
          .toList();

      for (final id in removedIds) {
        _knownDeviceIds.remove(id);
        print("🚫 设备下线：$id");
      }
    });
  }

  /// 停止发现
  Future<void> stop() async {
    if (_discovery != null) {
      print("🛑 停止服务发现");
      await stopDiscovery(_discovery!);
      _discovery = null;
      _knownDeviceIds.clear();
    }
  }
}
