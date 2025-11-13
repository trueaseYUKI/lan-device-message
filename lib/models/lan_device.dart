import 'package:freezed_annotation/freezed_annotation.dart';

part 'lan_device.freezed.dart';
part 'lan_device.g.dart';


// 使用freezed 代码生成将正式的操作代码封装到了freezed和g中
@freezed
class LANDevice with _$LANDevice {
  @JsonSerializable(explicitToJson: true)
  const factory LANDevice({
    required String deviceId,
    required String deviceType, // 设备类型（Android/IOS/Windows/MacOs/Linux）
    required String name,
    required String ip,
    required int port,
    String? avatarUrl,
  }) = _LANDevice;

  factory LANDevice.fromJson(Map<String, dynamic> json) =>
      _$LANDeviceFromJson(json);
}
