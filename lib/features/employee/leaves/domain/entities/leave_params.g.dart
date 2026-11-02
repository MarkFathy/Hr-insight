// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaveParams _$LeaveParamsFromJson(Map<String, dynamic> json) => _LeaveParams(
  notes: json['notes'] as String?,
  from: json['from'] == null ? null : DateTime.parse(json['from'] as String),
  to: json['to'] == null ? null : DateTime.parse(json['to'] as String),
  leaveType: json['leave_type'] as String?,
);

Map<String, dynamic> _$LeaveParamsToJson(_LeaveParams instance) =>
    <String, dynamic>{
      'notes': instance.notes,
      'from': instance.from?.toIso8601String(),
      'to': instance.to?.toIso8601String(),
      'leave_type': instance.leaveType,
    };
