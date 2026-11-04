// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departments_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DepartmentsEntity _$DepartmentsEntityFromJson(Map<String, dynamic> json) =>
    _DepartmentsEntity(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DepartmentDataEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DepartmentsEntityToJson(_DepartmentsEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

_DepartmentDataEntity _$DepartmentDataEntityFromJson(
  Map<String, dynamic> json,
) => _DepartmentDataEntity(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  managerId: (json['manager_id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  jobsCount: (json['jobs_count'] as num?)?.toInt(),
  numberOfEmployees: (json['number_of_employees'] as num?)?.toInt(),
  jobs: (json['jobs'] as List<dynamic>?)
      ?.map((e) => JobDataEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DepartmentDataEntityToJson(
  _DepartmentDataEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'manager_id': instance.managerId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'jobs_count': instance.jobsCount,
  'number_of_employees': instance.numberOfEmployees,
  'jobs': instance.jobs?.map((e) => e.toJson()).toList(),
};

_JobDataEntity _$JobDataEntityFromJson(Map<String, dynamic> json) =>
    _JobDataEntity(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      departmentId: (json['department_id'] as num?)?.toInt(),
      managerId: (json['manager_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      employeesCount: (json['employees_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$JobDataEntityToJson(_JobDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'department_id': instance.departmentId,
      'manager_id': instance.managerId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'employees_count': instance.employeesCount,
    };
