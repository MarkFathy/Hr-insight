// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManagerProfileModel _$ManagerProfileModelFromJson(Map<String, dynamic> json) =>
    _ManagerProfileModel(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ManagerDataEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManagerProfileModelToJson(
  _ManagerProfileModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data?.toJson(),
};
