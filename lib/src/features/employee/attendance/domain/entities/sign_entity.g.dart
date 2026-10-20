// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignEntity _$SignEntityFromJson(Map<String, dynamic> json) => _SignEntity(
  status: (json['status'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] as String?,
);

Map<String, dynamic> _$SignEntityToJson(_SignEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
