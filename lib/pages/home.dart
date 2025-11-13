// lib/pages/home.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'widget/home/current_device_info.dart';
import '../provider/lan_device_provider.dart';
import 'chat.dart';
import '../models/lan_device.dart';
import '../services/device_manager.dart'; // 添加导入

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final Set<String> _selectedDeviceIds = {};

  @override
  void initState() {
    super.initState();

    // 立即设置设备发现监听器，而不是在 addPostFrameCallback 中
    _setupDeviceDiscoveryListener();
  }

  void _setupDeviceDiscoveryListener() {
    // 使用 addPostFrameCallback 确保 ref 可用
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final deviceManager = ref.read(deviceManagerProvider);

      deviceManager.onDeviceFound = (LANDevice device) {
        ref.read(lanDeviceListProvider.notifier).addOrUpdateDevice(device);
      };

      deviceManager.onDeviceLost = (LANDevice device) {
        ref
            .read(lanDeviceListProvider.notifier)
            .removeDeviceById(device.deviceId);
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final devices = ref.watch(lanDeviceListProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CurrentDeviceInfo(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '局域网内其他设备',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  if (_selectedDeviceIds.isNotEmpty)
                    TextButton(
                      onPressed: () async {
                        final selectedDevices = devices
                            .where(
                              (device) =>
                                  _selectedDeviceIds.contains(device.deviceId),
                            )
                            .toList();

                        // 连接到选定设备（如果尚未连接）
                        final deviceManager = ref.read(deviceManagerProvider);
                        for (var device in selectedDevices) {
                          await deviceManager.connectToDevice(device);
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatPage(devices: selectedDevices),
                          ),
                        );

                        setState(() {
                          _selectedDeviceIds.clear();
                        });
                      },
                      child: const Text('开始聊天'),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    final device = devices[index];
                    final isSelected = _selectedDeviceIds.contains(
                      device.deviceId,
                    );

                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading: Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: isSelected ? Colors.blue : null,
                        ),
                        title: Text(device.name),
                        subtitle: Text('${device.ip}:${device.port}'),
                        trailing: Text(device.deviceType),
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              _selectedDeviceIds.remove(device.deviceId);
                            } else {
                              _selectedDeviceIds.add(device.deviceId);
                            }
                          });
                        },
                        onLongPress: () async {
                          // 连接并跳转到单聊
                          final deviceManager = ref.read(deviceManagerProvider);
                          await deviceManager.connectToDevice(device);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(device: device),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              if (_selectedDeviceIds.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '已选择 (${_selectedDeviceIds.length}) 个设备:',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Wrap(
                        spacing: 5,
                        children: devices
                            .where(
                              (device) =>
                                  _selectedDeviceIds.contains(device.deviceId),
                            )
                            .map(
                              (device) => Chip(
                                label: Text(device.name),
                                onDeleted: () {
                                  setState(() {
                                    _selectedDeviceIds.remove(device.deviceId);
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
