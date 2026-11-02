// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManagerEntity _$ManagerEntityFromJson(Map<String, dynamic> json) =>
    _ManagerEntity(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : TokenDataEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManagerEntityToJson(_ManagerEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

_TokenDataEntity _$TokenDataEntityFromJson(Map<String, dynamic> json) =>
    _TokenDataEntity(
      token: json['token'] as String?,
      manager: json['data'] == null
          ? null
          : ManagerDataEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenDataEntityToJson(_TokenDataEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'data': instance.manager?.toJson(),
    };

_ManagerDataEntity _$ManagerDataEntityFromJson(Map<String, dynamic> json) =>
    _ManagerDataEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      pin: json['pin'] as String?,
      status: json['status'] as String?,
      company: json['company'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ManagerDataEntityToJson(_ManagerDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'pin': instance.pin,
      'status': instance.status,
      'company': instance.company,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
