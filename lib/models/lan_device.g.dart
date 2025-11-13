// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lan_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LANDeviceImpl _$$LANDeviceImplFromJson(Map<String, dynamic> json) =>
    _$LANDeviceImpl(
      deviceId: json['deviceId'] as String,
      deviceType: json['deviceType'] as String,
      name: json['name'] as String,
      ip: json['ip'] as String,
      port: (json['port'] as num).toInt(),
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$$LANDeviceImplToJson(_$LANDeviceImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'deviceType': instance.deviceType,
      'name': instance.name,
      'ip': instance.ip,
      'port': instance.port,
      'avatarUrl': instance.avatarUrl,
    };
