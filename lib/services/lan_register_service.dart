import 'dart:typed_data';
import 'package:nsd/nsd.dart';

class LANRegisterService {
  final String serviceType;
  Registration? _registration;

  LANRegisterService({required this.serviceType});

  Future<void> registerService({
    required String deviceId,
    required String name,
    required int port,
    String? avatarUrl,
    String? deviceType,
  }) async {
    final service = Service(
      name: name,
      type: serviceType,
      port: port,
      txt: {
        'deviceId': Uint8List.fromList(deviceId.codeUnits),
        if (deviceType != null)
          'deviceType': Uint8List.fromList(deviceType.codeUnits),
        if (avatarUrl != null)
          'avatarUrl': Uint8List.fromList(avatarUrl.codeUnits),
      },
    );

    _registration = await register(service);
    print('Service registered: ${_registration!.service.name}');
  }

  Future<void> unregisterService() async {
    if (_registration != null) {
      await unregister(_registration!);
      _registration = null;
      print('Service unregistered');
    }
  }
}
