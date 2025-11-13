import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import '../models/lan_device.dart';

class LANDeviceListNotifier extends StateNotifier<List<LANDevice>> {
  LANDeviceListNotifier() : super([]);

  void addOrUpdateDevice(LANDevice device) {
    final index = state.indexWhere((d) => d.deviceId == device.deviceId);
    if (index == -1) {
      state = [...state, device];
    } else {
      final newState = [...state];
      newState[index] = device;
      state = newState;
    }
  }

  void removeDeviceById(String deviceId) {
    state = state.where((d) => d.deviceId != deviceId).toList();
  }

  void clear() => state = [];

  LANDevice? getDeviceById(String deviceId) {
    try {
      return state.firstWhere((d) => d.deviceId == deviceId);
    } catch (e) {
      return null;
    }
  }
}

final lanDeviceListProvider =
    StateNotifierProvider<LANDeviceListNotifier, List<LANDevice>>(
      (ref) => LANDeviceListNotifier(),
    );
