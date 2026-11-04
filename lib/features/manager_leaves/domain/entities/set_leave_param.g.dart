// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_leave_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SetLeaveParams _$SetLeaveParamsFromJson(Map<String, dynamic> json) =>
    _SetLeaveParams(
      id: (json['leave_id'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SetLeaveParamsToJson(_SetLeaveParams instance) =>
    <String, dynamic>{'leave_id': instance.id, 'status': instance.status};
