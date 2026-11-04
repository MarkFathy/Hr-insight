// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_employee_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SetEmployeeParams _$SetEmployeeParamsFromJson(Map<String, dynamic> json) =>
    _SetEmployeeParams(
      employeeId: (json['employee_id'] as num).toInt(),
      officeId: (json['office_id'] as num?)?.toInt(),
      jobId: (json['job_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SetEmployeeParamsToJson(_SetEmployeeParams instance) =>
    <String, dynamic>{
      'employee_id': instance.employeeId,
      'office_id': instance.officeId,
      'job_id': instance.jobId,
    };
