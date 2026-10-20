// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobParams _$JobParamsFromJson(Map<String, dynamic> json) => _JobParams(
  title: json['title'] as String?,
  jobId: (json['job_id'] as num?)?.toInt(),
  departmentId: (json['department_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$JobParamsToJson(_JobParams instance) =>
    <String, dynamic>{
      'title': instance.title,
      'job_id': instance.jobId,
      'department_id': instance.departmentId,
    };
