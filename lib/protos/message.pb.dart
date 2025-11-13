// This is a generated file - do not edit.
//
// Generated from protos/message.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'message.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'message.pbenum.dart';

/// ------------------- 外层 envelope -------------------
class Envelope extends $pb.GeneratedMessage {
  factory Envelope({
    $core.String? version,
    $core.String? messageId,
    $fixnum.Int64? timestamp,
    Sender? sender,
    ChatScope? scope,
    PayloadType? payloadType,
    TextPayload? text,
    FileMeta? fileMeta,
    FileChunk? fileChunk,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (messageId != null) result.messageId = messageId;
    if (timestamp != null) result.timestamp = timestamp;
    if (sender != null) result.sender = sender;
    if (scope != null) result.scope = scope;
    if (payloadType != null) result.payloadType = payloadType;
    if (text != null) result.text = text;
    if (fileMeta != null) result.fileMeta = fileMeta;
    if (fileChunk != null) result.fileChunk = fileChunk;
    return result;
  }

  Envelope._();

  factory Envelope.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Envelope.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Envelope',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'lanmessenger'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'version')
    ..aOS(2, _omitFieldNames ? '' : 'messageId', protoName: 'messageId')
    ..aInt64(3, _omitFieldNames ? '' : 'timestamp')
    ..aOM<Sender>(4, _omitFieldNames ? '' : 'sender', subBuilder: Sender.create)
    ..aOM<ChatScope>(5, _omitFieldNames ? '' : 'scope',
        subBuilder: ChatScope.create)
    ..aE<PayloadType>(6, _omitFieldNames ? '' : 'payloadType',
        protoName: 'payloadType', enumValues: PayloadType.values)
    ..aOM<TextPayload>(7, _omitFieldNames ? '' : 'text',
        subBuilder: TextPayload.create)
    ..aOM<FileMeta>(8, _omitFieldNames ? '' : 'fileMeta',
        protoName: 'fileMeta', subBuilder: FileMeta.create)
    ..aOM<FileChunk>(9, _omitFieldNames ? '' : 'fileChunk',
        protoName: 'fileChunk', subBuilder: FileChunk.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Envelope clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Envelope copyWith(void Function(Envelope) updates) =>
      super.copyWith((message) => updates(message as Envelope)) as Envelope;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Envelope create() => Envelope._();
  @$core.override
  Envelope createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Envelope getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Envelope>(create);
  static Envelope? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get messageId => $_getSZ(1);
  @$pb.TagNumber(2)
  set messageId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessageId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);

  @$pb.TagNumber(4)
  Sender get sender => $_getN(3);
  @$pb.TagNumber(4)
  set sender(Sender value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasSender() => $_has(3);
  @$pb.TagNumber(4)
  void clearSender() => $_clearField(4);
  @$pb.TagNumber(4)
  Sender ensureSender() => $_ensure(3);

  @$pb.TagNumber(5)
  ChatScope get scope => $_getN(4);
  @$pb.TagNumber(5)
  set scope(ChatScope value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasScope() => $_has(4);
  @$pb.TagNumber(5)
  void clearScope() => $_clearField(5);
  @$pb.TagNumber(5)
  ChatScope ensureScope() => $_ensure(4);

  @$pb.TagNumber(6)
  PayloadType get payloadType => $_getN(5);
  @$pb.TagNumber(6)
  set payloadType(PayloadType value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasPayloadType() => $_has(5);
  @$pb.TagNumber(6)
  void clearPayloadType() => $_clearField(6);

  /// payload 可选，只会使用对应类型
  @$pb.TagNumber(7)
  TextPayload get text => $_getN(6);
  @$pb.TagNumber(7)
  set text(TextPayload value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasText() => $_has(6);
  @$pb.TagNumber(7)
  void clearText() => $_clearField(7);
  @$pb.TagNumber(7)
  TextPayload ensureText() => $_ensure(6);

  @$pb.TagNumber(8)
  FileMeta get fileMeta => $_getN(7);
  @$pb.TagNumber(8)
  set fileMeta(FileMeta value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasFileMeta() => $_has(7);
  @$pb.TagNumber(8)
  void clearFileMeta() => $_clearField(8);
  @$pb.TagNumber(8)
  FileMeta ensureFileMeta() => $_ensure(7);

  @$pb.TagNumber(9)
  FileChunk get fileChunk => $_getN(8);
  @$pb.TagNumber(9)
  set fileChunk(FileChunk value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasFileChunk() => $_has(8);
  @$pb.TagNumber(9)
  void clearFileChunk() => $_clearField(9);
  @$pb.TagNumber(9)
  FileChunk ensureFileChunk() => $_ensure(8);
}

/// ------------------- 发送者信息 -------------------
class Sender extends $pb.GeneratedMessage {
  factory Sender({
    $core.String? deviceId,
    $core.String? nickname,
    $core.String? avatarUrl,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (nickname != null) result.nickname = nickname;
    if (avatarUrl != null) result.avatarUrl = avatarUrl;
    return result;
  }

  Sender._();

  factory Sender.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Sender.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Sender',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'lanmessenger'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'avatarUrl', protoName: 'avatarUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Sender clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Sender copyWith(void Function(Sender) updates) =>
      super.copyWith((message) => updates(message as Sender)) as Sender;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Sender create() => Sender._();
  @$core.override
  Sender createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Sender getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Sender>(create);
  static Sender? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatarUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatarUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatarUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatarUrl() => $_clearField(3);
}

/// ------------------- 消息范围 -------------------
class ChatScope extends $pb.GeneratedMessage {
  factory ChatScope({
    ScopeType? type,
    $core.String? targetId,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (targetId != null) result.targetId = targetId;
    return result;
  }

  ChatScope._();

  factory ChatScope.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatScope.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatScope',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'lanmessenger'),
      createEmptyInstance: create)
    ..aE<ScopeType>(1, _omitFieldNames ? '' : 'type',
        enumValues: ScopeType.values)
    ..aOS(2, _omitFieldNames ? '' : 'targetId', protoName: 'targetId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatScope clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatScope copyWith(void Function(ChatScope) updates) =>
      super.copyWith((message) => updates(message as ChatScope)) as ChatScope;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatScope create() => ChatScope._();
  @$core.override
  ChatScope createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatScope getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatScope>(create);
  static ChatScope? _defaultInstance;

  @$pb.TagNumber(1)
  ScopeType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ScopeType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get targetId => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTargetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetId() => $_clearField(2);
}

/// ------------------- 文本消息 -------------------
class TextPayload extends $pb.GeneratedMessage {
  factory TextPayload({
    $core.String? content,
  }) {
    final result = create();
    if (content != null) result.content = content;
    return result;
  }

  TextPayload._();

  factory TextPayload.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextPayload.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextPayload',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'lanmessenger'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextPayload clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextPayload copyWith(void Function(TextPayload) updates) =>
      super.copyWith((message) => updates(message as TextPayload))
          as TextPayload;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextPayload create() => TextPayload._();
  @$core.override
  TextPayload createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TextPayload getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextPayload>(create);
  static TextPayload? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);
}

/// ------------------- 文件信息 -------------------
class FileMeta extends $pb.GeneratedMessage {
  factory FileMeta({
    $core.String? fileId,
    $core.String? fileName,
    $fixnum.Int64? totalSize,
    $core.String? mimeType,
    $fixnum.Int64? chunkSize,
  }) {
    final result = create();
    if (fileId != null) result.fileId = fileId;
    if (fileName != null) result.fileName = fileName;
    if (totalSize != null) result.totalSize = totalSize;
    if (mimeType != null) result.mimeType = mimeType;
    if (chunkSize != null) result.chunkSize = chunkSize;
    return result;
  }

  FileMeta._();

  factory FileMeta.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FileMeta.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FileMeta',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'lanmessenger'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileId', protoName: 'fileId')
    ..aOS(2, _omitFieldNames ? '' : 'fileName', protoName: 'fileName')
    ..aInt64(3, _omitFieldNames ? '' : 'totalSize', protoName: 'totalSize')
    ..aOS(4, _omitFieldNames ? '' : 'mimeType', protoName: 'mimeType')
    ..aInt64(5, _omitFieldNames ? '' : 'chunkSize', protoName: 'chunkSize')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileMeta clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileMeta copyWith(void Function(FileMeta) updates) =>
      super.copyWith((message) => updates(message as FileMeta)) as FileMeta;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileMeta create() => FileMeta._();
  @$core.override
  FileMeta createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FileMeta getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileMeta>(create);
  static FileMeta? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get totalSize => $_getI64(2);
  @$pb.TagNumber(3)
  set totalSize($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalSize() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get mimeType => $_getSZ(3);
  @$pb.TagNumber(4)
  set mimeType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMimeType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMimeType() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get chunkSize => $_getI64(4);
  @$pb.TagNumber(5)
  set chunkSize($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasChunkSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearChunkSize() => $_clearField(5);
}

/// ------------------- 文件分片 -------------------
class FileChunk extends $pb.GeneratedMessage {
  factory FileChunk({
    $core.String? fileId,
    $fixnum.Int64? chunkIndex,
    $core.List<$core.int>? data,
  }) {
    final result = create();
    if (fileId != null) result.fileId = fileId;
    if (chunkIndex != null) result.chunkIndex = chunkIndex;
    if (data != null) result.data = data;
    return result;
  }

  FileChunk._();

  factory FileChunk.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FileChunk.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FileChunk',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'lanmessenger'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileId', protoName: 'fileId')
    ..aInt64(2, _omitFieldNames ? '' : 'chunkIndex', protoName: 'chunkIndex')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileChunk clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileChunk copyWith(void Function(FileChunk) updates) =>
      super.copyWith((message) => updates(message as FileChunk)) as FileChunk;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileChunk create() => FileChunk._();
  @$core.override
  FileChunk createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FileChunk getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileChunk>(create);
  static FileChunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get chunkIndex => $_getI64(1);
  @$pb.TagNumber(2)
  set chunkIndex($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChunkIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunkIndex() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
