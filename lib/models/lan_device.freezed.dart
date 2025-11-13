// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lan_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LANDevice _$LANDeviceFromJson(Map<String, dynamic> json) {
  return _LANDevice.fromJson(json);
}

/// @nodoc
mixin _$LANDevice {
  String get deviceId => throw _privateConstructorUsedError;
  String get deviceType =>
      throw _privateConstructorUsedError; // 设备类型（Android/IOS/Windows/MacOs/Linux）
  String get name => throw _privateConstructorUsedError;
  String get ip => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this LANDevice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LANDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LANDeviceCopyWith<LANDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LANDeviceCopyWith<$Res> {
  factory $LANDeviceCopyWith(LANDevice value, $Res Function(LANDevice) then) =
      _$LANDeviceCopyWithImpl<$Res, LANDevice>;
  @useResult
  $Res call({
    String deviceId,
    String deviceType,
    String name,
    String ip,
    int port,
    String? avatarUrl,
  });
}

/// @nodoc
class _$LANDeviceCopyWithImpl<$Res, $Val extends LANDevice>
    implements $LANDeviceCopyWith<$Res> {
  _$LANDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LANDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? deviceType = null,
    Object? name = null,
    Object? ip = null,
    Object? port = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            deviceId: null == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String,
            deviceType: null == deviceType
                ? _value.deviceType
                : deviceType // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            ip: null == ip
                ? _value.ip
                : ip // ignore: cast_nullable_to_non_nullable
                      as String,
            port: null == port
                ? _value.port
                : port // ignore: cast_nullable_to_non_nullable
                      as int,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LANDeviceImplCopyWith<$Res>
    implements $LANDeviceCopyWith<$Res> {
  factory _$$LANDeviceImplCopyWith(
    _$LANDeviceImpl value,
    $Res Function(_$LANDeviceImpl) then,
  ) = __$$LANDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String deviceId,
    String deviceType,
    String name,
    String ip,
    int port,
    String? avatarUrl,
  });
}

/// @nodoc
class __$$LANDeviceImplCopyWithImpl<$Res>
    extends _$LANDeviceCopyWithImpl<$Res, _$LANDeviceImpl>
    implements _$$LANDeviceImplCopyWith<$Res> {
  __$$LANDeviceImplCopyWithImpl(
    _$LANDeviceImpl _value,
    $Res Function(_$LANDeviceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LANDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? deviceType = null,
    Object? name = null,
    Object? ip = null,
    Object? port = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _$LANDeviceImpl(
        deviceId: null == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceType: null == deviceType
            ? _value.deviceType
            : deviceType // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        ip: null == ip
            ? _value.ip
            : ip // ignore: cast_nullable_to_non_nullable
                  as String,
        port: null == port
            ? _value.port
            : port // ignore: cast_nullable_to_non_nullable
                  as int,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LANDeviceImpl implements _LANDevice {
  const _$LANDeviceImpl({
    required this.deviceId,
    required this.deviceType,
    required this.name,
    required this.ip,
    required this.port,
    this.avatarUrl,
  });

  factory _$LANDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$LANDeviceImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String deviceType;
  // 设备类型（Android/IOS/Windows/MacOs/Linux）
  @override
  final String name;
  @override
  final String ip;
  @override
  final int port;
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'LANDevice(deviceId: $deviceId, deviceType: $deviceType, name: $name, ip: $ip, port: $port, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LANDeviceImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, deviceId, deviceType, name, ip, port, avatarUrl);

  /// Create a copy of LANDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LANDeviceImplCopyWith<_$LANDeviceImpl> get copyWith =>
      __$$LANDeviceImplCopyWithImpl<_$LANDeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LANDeviceImplToJson(this);
  }
}

abstract class _LANDevice implements LANDevice {
  const factory _LANDevice({
    required final String deviceId,
    required final String deviceType,
    required final String name,
    required final String ip,
    required final int port,
    final String? avatarUrl,
  }) = _$LANDeviceImpl;

  factory _LANDevice.fromJson(Map<String, dynamic> json) =
      _$LANDeviceImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get deviceType; // 设备类型（Android/IOS/Windows/MacOs/Linux）
  @override
  String get name;
  @override
  String get ip;
  @override
  int get port;
  @override
  String? get avatarUrl;

  /// Create a copy of LANDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LANDeviceImplCopyWith<_$LANDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
