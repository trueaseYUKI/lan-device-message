import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:math';

/// 生成设备信息工具类
class DeviceInfoUtils {
  static const String _deviceIdKey = 'device_id';
  static const String _deviceNameKey = 'device_name';
  static const String _deviceTypeKey = 'device_type';

  /// 获取或创建设备信息
  static Future<Map<String, String>> getOrCreateDeviceInfo() async {
    // 1.获取SharedPerferences实例
    final prefs = await SharedPreferences.getInstance();

    final deviceId = prefs.getString(_deviceIdKey);
    final deviceName = prefs.getString(_deviceNameKey);
    final deviceType = prefs.getString(_deviceTypeKey) ?? _getDeviceType();

    String newDeviceId = deviceId ?? _generateDeviceId();
    String newDeviceName = deviceName ?? _generateDeviceName();

    // 如果是新设备，保存到SharedPreferences中
    if (deviceId == null) {
      await prefs.setString(_deviceIdKey, newDeviceId);
    }

    if (deviceName == null) {
      await prefs.setString(_deviceNameKey, newDeviceName);
    }

    if (prefs.getString(_deviceTypeKey) == null) {
      await prefs.setString(_deviceTypeKey, deviceType);
    }

    return {
      'deviceId': newDeviceId,
      'deviceName': newDeviceName,
      'deviceType': deviceType,
    };
  }

  /// 生成设备的ID
  static String _generateDeviceId() {
    final deviceType = _getDeviceType();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomPart = Random().nextInt(99999999);
    return '${deviceType}_${timestamp}_$randomPart';
  }

  /// 生成设备名称
  static String _generateDeviceName() {
    final adjectives = ['智能', '极速', '灵动', '极客', '先锋', '卓越', '创新', '领航'];
    final nouns = ['手机', '设备', '终端', '助手', '伙伴', '精灵'];

    final random = Random();
    final adjective = adjectives[random.nextInt(adjectives.length)];
    final noun = nouns[random.nextInt(nouns.length)];
    final number = random.nextInt(9999);

    return '$adjective$noun-$number';
  }

  /// 获取设备类型
  static String _getDeviceType() {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'IOS';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else if (Platform.isMacOS) {
      return 'MacOS';
    } else {
      return 'Unknow';
    }
  }
}
