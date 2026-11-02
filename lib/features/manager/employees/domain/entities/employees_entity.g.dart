// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeesEntity _$EmployeesEntityFromJson(Map<String, dynamic> json) =>
    _EmployeesEntity(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: _employeesDataFromJson(json['data']),
    );

Map<String, dynamic> _$EmployeesEntityToJson(_EmployeesEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
