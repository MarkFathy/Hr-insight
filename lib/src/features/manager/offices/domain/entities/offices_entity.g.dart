// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offices_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfficesEntity _$OfficesEntityFromJson(Map<String, dynamic> json) =>
    _OfficesEntity(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OfficeDataEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OfficesEntityToJson(_OfficesEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

_OfficeDataEntity _$OfficeDataEntityFromJson(Map<String, dynamic> json) =>
    _OfficeDataEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      radius: _radiusFromJson(json['radius']),
      managerId: (json['manager_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      employeeCount: (json['employees_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OfficeDataEntityToJson(_OfficeDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
      'radius': instance.radius,
      'manager_id': instance.managerId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'employees_count': instance.employeeCount,
    };
