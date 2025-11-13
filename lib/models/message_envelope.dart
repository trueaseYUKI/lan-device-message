// simple JSON envelope used for runtime testing (we'll migrate to protobuf later)
class MessageEnvelope {
  final String version;
  final String messageId;
  final int timestamp;
  final String deviceId;
  final String deviceName;
  final String msg;

  MessageEnvelope({
    required this.version,
    required this.messageId,
    required this.timestamp,
    required this.deviceId,
    required this.deviceName,
    required this.msg,
  });

  factory MessageEnvelope.fromJson(Map<String, dynamic> j) => MessageEnvelope(
    version: j['version'] as String? ?? '1.0.0',
    messageId: j['messageId'] as String? ?? '',
    timestamp: (j['timestamp'] as num?)?.toInt() ?? 0,
    deviceId: j['deviceId'] as String? ?? '',
    deviceName: j['deviceName'] as String? ?? '',
    msg: j['msg'] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    'version': version,
    'messageId': messageId,
    'timestamp': timestamp,
    'deviceId': deviceId,
    'deviceName': deviceName,
    'msg': msg,
  };
}
