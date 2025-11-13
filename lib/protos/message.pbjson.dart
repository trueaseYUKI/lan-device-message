// This is a generated file - do not edit.
//
// Generated from protos/message.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use scopeTypeDescriptor instead')
const ScopeType$json = {
  '1': 'ScopeType',
  '2': [
    {'1': 'BROADCAST', '2': 0},
    {'1': 'PRIVATE', '2': 1},
    {'1': 'GROUP', '2': 2},
  ],
};

/// Descriptor for `ScopeType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List scopeTypeDescriptor = $convert.base64Decode(
    'CglTY29wZVR5cGUSDQoJQlJPQURDQVNUEAASCwoHUFJJVkFURRABEgkKBUdST1VQEAI=');

@$core.Deprecated('Use payloadTypeDescriptor instead')
const PayloadType$json = {
  '1': 'PayloadType',
  '2': [
    {'1': 'TEXT', '2': 0},
    {'1': 'FILE_META', '2': 1},
    {'1': 'FILE_CHUNK', '2': 2},
  ],
};

/// Descriptor for `PayloadType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List payloadTypeDescriptor = $convert.base64Decode(
    'CgtQYXlsb2FkVHlwZRIICgRURVhUEAASDQoJRklMRV9NRVRBEAESDgoKRklMRV9DSFVOSxAC');

@$core.Deprecated('Use envelopeDescriptor instead')
const Envelope$json = {
  '1': 'Envelope',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 9, '10': 'version'},
    {'1': 'messageId', '3': 2, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'timestamp', '3': 3, '4': 1, '5': 3, '10': 'timestamp'},
    {
      '1': 'sender',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.lanmessenger.Sender',
      '10': 'sender'
    },
    {
      '1': 'scope',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.lanmessenger.ChatScope',
      '10': 'scope'
    },
    {
      '1': 'payloadType',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.lanmessenger.PayloadType',
      '10': 'payloadType'
    },
    {
      '1': 'text',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.lanmessenger.TextPayload',
      '10': 'text'
    },
    {
      '1': 'fileMeta',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.lanmessenger.FileMeta',
      '10': 'fileMeta'
    },
    {
      '1': 'fileChunk',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.lanmessenger.FileChunk',
      '10': 'fileChunk'
    },
  ],
};

/// Descriptor for `Envelope`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List envelopeDescriptor = $convert.base64Decode(
    'CghFbnZlbG9wZRIYCgd2ZXJzaW9uGAEgASgJUgd2ZXJzaW9uEhwKCW1lc3NhZ2VJZBgCIAEoCV'
    'IJbWVzc2FnZUlkEhwKCXRpbWVzdGFtcBgDIAEoA1IJdGltZXN0YW1wEiwKBnNlbmRlchgEIAEo'
    'CzIULmxhbm1lc3Nlbmdlci5TZW5kZXJSBnNlbmRlchItCgVzY29wZRgFIAEoCzIXLmxhbm1lc3'
    'Nlbmdlci5DaGF0U2NvcGVSBXNjb3BlEjsKC3BheWxvYWRUeXBlGAYgASgOMhkubGFubWVzc2Vu'
    'Z2VyLlBheWxvYWRUeXBlUgtwYXlsb2FkVHlwZRItCgR0ZXh0GAcgASgLMhkubGFubWVzc2VuZ2'
    'VyLlRleHRQYXlsb2FkUgR0ZXh0EjIKCGZpbGVNZXRhGAggASgLMhYubGFubWVzc2VuZ2VyLkZp'
    'bGVNZXRhUghmaWxlTWV0YRI1CglmaWxlQ2h1bmsYCSABKAsyFy5sYW5tZXNzZW5nZXIuRmlsZU'
    'NodW5rUglmaWxlQ2h1bms=');

@$core.Deprecated('Use senderDescriptor instead')
const Sender$json = {
  '1': 'Sender',
  '2': [
    {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'avatarUrl', '3': 3, '4': 1, '5': 9, '10': 'avatarUrl'},
  ],
};

/// Descriptor for `Sender`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List senderDescriptor = $convert.base64Decode(
    'CgZTZW5kZXISGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEhoKCG5pY2tuYW1lGAIgASgJUg'
    'huaWNrbmFtZRIcCglhdmF0YXJVcmwYAyABKAlSCWF2YXRhclVybA==');

@$core.Deprecated('Use chatScopeDescriptor instead')
const ChatScope$json = {
  '1': 'ChatScope',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.lanmessenger.ScopeType',
      '10': 'type'
    },
    {'1': 'targetId', '3': 2, '4': 1, '5': 9, '10': 'targetId'},
  ],
};

/// Descriptor for `ChatScope`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatScopeDescriptor = $convert.base64Decode(
    'CglDaGF0U2NvcGUSKwoEdHlwZRgBIAEoDjIXLmxhbm1lc3Nlbmdlci5TY29wZVR5cGVSBHR5cG'
    'USGgoIdGFyZ2V0SWQYAiABKAlSCHRhcmdldElk');

@$core.Deprecated('Use textPayloadDescriptor instead')
const TextPayload$json = {
  '1': 'TextPayload',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `TextPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textPayloadDescriptor = $convert
    .base64Decode('CgtUZXh0UGF5bG9hZBIYCgdjb250ZW50GAEgASgJUgdjb250ZW50');

@$core.Deprecated('Use fileMetaDescriptor instead')
const FileMeta$json = {
  '1': 'FileMeta',
  '2': [
    {'1': 'fileId', '3': 1, '4': 1, '5': 9, '10': 'fileId'},
    {'1': 'fileName', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'totalSize', '3': 3, '4': 1, '5': 3, '10': 'totalSize'},
    {'1': 'mimeType', '3': 4, '4': 1, '5': 9, '10': 'mimeType'},
    {'1': 'chunkSize', '3': 5, '4': 1, '5': 3, '10': 'chunkSize'},
  ],
};

/// Descriptor for `FileMeta`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileMetaDescriptor = $convert.base64Decode(
    'CghGaWxlTWV0YRIWCgZmaWxlSWQYASABKAlSBmZpbGVJZBIaCghmaWxlTmFtZRgCIAEoCVIIZm'
    'lsZU5hbWUSHAoJdG90YWxTaXplGAMgASgDUgl0b3RhbFNpemUSGgoIbWltZVR5cGUYBCABKAlS'
    'CG1pbWVUeXBlEhwKCWNodW5rU2l6ZRgFIAEoA1IJY2h1bmtTaXpl');

@$core.Deprecated('Use fileChunkDescriptor instead')
const FileChunk$json = {
  '1': 'FileChunk',
  '2': [
    {'1': 'fileId', '3': 1, '4': 1, '5': 9, '10': 'fileId'},
    {'1': 'chunkIndex', '3': 2, '4': 1, '5': 3, '10': 'chunkIndex'},
    {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `FileChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileChunkDescriptor = $convert.base64Decode(
    'CglGaWxlQ2h1bmsSFgoGZmlsZUlkGAEgASgJUgZmaWxlSWQSHgoKY2h1bmtJbmRleBgCIAEoA1'
    'IKY2h1bmtJbmRleBISCgRkYXRhGAMgASgMUgRkYXRh');
