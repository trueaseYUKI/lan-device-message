import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:io';
import 'dart:math';
import 'package:network_info_plus/network_info_plus.dart';

import 'package:devices_lan/utils/device_info_utils.dart';

class CurrentDeviceInfo extends ConsumerStatefulWidget {
  const CurrentDeviceInfo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CurrentDeviceInfoState();
}

class _CurrentDeviceInfoState extends ConsumerState<CurrentDeviceInfo> {
  String? _localIp;
  final int _port = 9050;
  Map<String, String>? _deviceInfo;

  @override
  void initState() {
    super.initState();
    _loadDeviceInfo();
    _getLocalIpAddress();
  }

  /// 加载设备信息
  Future<void> _loadDeviceInfo() async {
    try {
      final info = await DeviceInfoUtils.getOrCreateDeviceInfo();
      setState(() {
        _deviceInfo = info;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('加载设备信息失败: $e')));
      }
    }
  }

  /// 获取本机IP地址
  Future<void> _getLocalIpAddress() async {
    try {
      final info = NetworkInfo();
      final wifiIp = await info.getWifiIP();

      if (wifiIp != null) {
        setState(() {
          _localIp = wifiIp;
        });
        return;
      }

      // 如果无法获取WiFi IP，尝试获取其他网络接口IP
      final interfaces = await NetworkInterface.list(
        includeLoopback: false,
        type: InternetAddressType.IPv4,
      );

      for (final interface in interfaces) {
        for (final addr in interface.addresses) {
          if (addr.address.startsWith('192.168.') ||
              addr.address.startsWith('10.') ||
              addr.address.startsWith('172.')) {
            setState(() {
              _localIp = addr.address;
            });
            return;
          }
        }
      }

      // 如果还是没有获取到，设置为默认值
      setState(() {
        _localIp = '获取中...';
      });
    } catch (e) {
      setState(() {
        _localIp = '无法获取';
      });
      debugPrint('获取IP地址失败: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.phone_android, color: Colors.blue, size: 28),
                  SizedBox(width: 10),
                  Text(
                    '本机信息',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _DeviceInfoRow(
                icon: Icons.devices,
                label: '设备名称',
                value: _deviceInfo?['deviceName'] ?? '加载中...',
              ),
              _DeviceInfoRow(
                icon: Icons.memory,
                label: '设备类型',
                value: _deviceInfo?['deviceType'] ?? '未知',
              ),
              _DeviceInfoRow(
                icon: Icons.vpn_key,
                label: '设备ID',
                value: _deviceInfo?['deviceId'] ?? '加载中...',
              ),
              _DeviceInfoRow(
                icon: Icons.network_wifi,
                label: 'IP地址',
                value: _localIp ?? '获取中...',
              ),
              _DeviceInfoRow(
                icon: Icons.settings_ethernet,
                label: '端口',
                value: '$_port',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 设备信息行组件
class _DeviceInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DeviceInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[700]),
          const SizedBox(width: 12),
          Text(
            '$label: ',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
