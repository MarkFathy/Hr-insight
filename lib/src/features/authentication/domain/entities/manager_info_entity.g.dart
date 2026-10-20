// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManagerInfoEntity _$ManagerInfoEntityFromJson(Map<String, dynamic> json) =>
    _ManagerInfoEntity(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ManageInfoDataEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManagerInfoEntityToJson(_ManagerInfoEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

_ManageInfoDataEntity _$ManageInfoDataEntityFromJson(
  Map<String, dynamic> json,
) => _ManageInfoDataEntity(
  manager: ManagerDataEntity.fromJson(json['manager'] as Map<String, dynamic>),
  departments:
      (json['departments'] as List<dynamic>?)
          ?.map((e) => DepartmentDataEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  offices:
      (json['offices'] as List<dynamic>?)
          ?.map((e) => OfficeDataEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ManageInfoDataEntityToJson(
  _ManageInfoDataEntity instance,
) => <String, dynamic>{
  'manager': instance.manager.toJson(),
  'departments': instance.departments.map((e) => e.toJson()).toList(),
  'offices': instance.offices.map((e) => e.toJson()).toList(),
};
