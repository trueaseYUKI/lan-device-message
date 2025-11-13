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

import 'package:protobuf/protobuf.dart' as $pb;

class ScopeType extends $pb.ProtobufEnum {
  static const ScopeType BROADCAST =
      ScopeType._(0, _omitEnumNames ? '' : 'BROADCAST');
  static const ScopeType PRIVATE =
      ScopeType._(1, _omitEnumNames ? '' : 'PRIVATE');
  static const ScopeType GROUP = ScopeType._(2, _omitEnumNames ? '' : 'GROUP');

  static const $core.List<ScopeType> values = <ScopeType>[
    BROADCAST,
    PRIVATE,
    GROUP,
  ];

  static final $core.List<ScopeType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ScopeType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ScopeType._(super.value, super.name);
}

/// ------------------- 消息类型 -------------------
class PayloadType extends $pb.ProtobufEnum {
  static const PayloadType TEXT =
      PayloadType._(0, _omitEnumNames ? '' : 'TEXT');
  static const PayloadType FILE_META =
      PayloadType._(1, _omitEnumNames ? '' : 'FILE_META');
  static const PayloadType FILE_CHUNK =
      PayloadType._(2, _omitEnumNames ? '' : 'FILE_CHUNK');

  static const $core.List<PayloadType> values = <PayloadType>[
    TEXT,
    FILE_META,
    FILE_CHUNK,
  ];

  static final $core.List<PayloadType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static PayloadType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PayloadType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
