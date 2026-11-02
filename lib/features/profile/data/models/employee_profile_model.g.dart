// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeProfileModel _$EmployeeProfileModelFromJson(
  Map<String, dynamic> json,
) => _EmployeeProfileModel(
  status: (json['status'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : EmployeeDataEntity.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EmployeeProfileModelToJson(
  _EmployeeProfileModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data?.toJson(),
};
