// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaves_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeavesEntity _$LeavesEntityFromJson(Map<String, dynamic> json) =>
    _LeavesEntity(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: _leavesDataFromJson(json['data']),
    );

Map<String, dynamic> _$LeavesEntityToJson(_LeavesEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

_LeavesDataEntity _$LeavesDataEntityFromJson(Map<String, dynamic> json) =>
    _LeavesDataEntity(
      id: (json['id'] as num?)?.toInt(),
      employeeId: (json['employee_id'] as num?)?.toInt(),
      managerId: (json['manager_id'] as num?)?.toInt(),
      dayDate: json['day_date'] == null
          ? null
          : DateTime.parse(json['day_date'] as String),
      from: json['from'] == null
          ? null
          : DateTime.parse(json['from'] as String),
      to: json['to'] == null ? null : DateTime.parse(json['to'] as String),
      leaveType: json['leave_type'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$LeavesDataEntityToJson(_LeavesDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employee_id': instance.employeeId,
      'manager_id': instance.managerId,
      'day_date': instance.dayDate?.toIso8601String(),
      'from': instance.from?.toIso8601String(),
      'to': instance.to?.toIso8601String(),
      'leave_type': instance.leaveType,
      'status': instance.status,
      'notes': instance.notes,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
