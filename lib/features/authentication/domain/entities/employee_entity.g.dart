// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeEntity _$EmployeeEntityFromJson(Map<String, dynamic> json) =>
    _EmployeeEntity(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserDataEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeEntityToJson(_EmployeeEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

_UserDataEntity _$UserDataEntityFromJson(Map<String, dynamic> json) =>
    _UserDataEntity(
      token: json['token'] as String?,
      employee: json['data'] == null
          ? null
          : EmployeeDataEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataEntityToJson(_UserDataEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'data': instance.employee?.toJson(),
    };

_EmployeeDataEntity _$EmployeeDataEntityFromJson(Map<String, dynamic> json) =>
    _EmployeeDataEntity(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      image: json['image'] as String?,
      uID: json['UID'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: (json['id'] as num?)?.toInt(),
      manager: json['manager'] == null
          ? null
          : ManagerDataEntity.fromJson(json['manager'] as Map<String, dynamic>),
      job: json['job'] == null
          ? null
          : JobEntity.fromJson(json['job'] as Map<String, dynamic>),
      department: json['department'] == null
          ? null
          : DepartmentDataEntity.fromJson(
              json['department'] as Map<String, dynamic>,
            ),
      office: json['office'] == null
          ? null
          : OfficeDataEntity.fromJson(json['office'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeDataEntityToJson(_EmployeeDataEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'image': instance.image,
      'UID': instance.uID,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
      'manager': instance.manager?.toJson(),
      'job': instance.job?.toJson(),
      'department': instance.department?.toJson(),
      'office': instance.office?.toJson(),
    };

_JobEntity _$JobEntityFromJson(Map<String, dynamic> json) => _JobEntity(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  departmentId: (json['department_id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$JobEntityToJson(_JobEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'department_id': instance.departmentId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
