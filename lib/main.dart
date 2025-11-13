import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'pages/main_screen.dart';
import 'services/device_manager.dart';

void main() {
  runApp(const ProviderScope(child: LANMessengerApp()));
}

class LANMessengerApp extends ConsumerStatefulWidget {
  const LANMessengerApp({super.key});

  @override
  ConsumerState<LANMessengerApp> createState() => _LANMessengerAppState();
}

class _LANMessengerAppState extends ConsumerState<LANMessengerApp> {
  @override
  void initState() {
    super.initState();
    _initServices();
  }

  Future<void> _initServices() async {
    final deviceManager = ref.read(deviceManagerProvider);
    await deviceManager.init();
    await deviceManager.startServices();
  }

  @override
  void dispose() {
    // 停止服务
    final deviceManager = ref.read(deviceManagerProvider);
    deviceManager.stopServices();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '局域网消息系统',
      home: const MainScreen(),
    );
  }
}
