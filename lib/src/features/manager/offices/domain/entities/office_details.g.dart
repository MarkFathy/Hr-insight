// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfficeDetailsEntity _$OfficeDetailsEntityFromJson(Map<String, dynamic> json) =>
    _OfficeDetailsEntity(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : OfficeDetailsDataEntity.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$OfficeDetailsEntityToJson(
  _OfficeDetailsEntity instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data?.toJson(),
};

_OfficeDetailsDataEntity _$OfficeDetailsDataEntityFromJson(
  Map<String, dynamic> json,
) => _OfficeDetailsDataEntity(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  radius: _radiusFromJson(json['radius']),
  managerId: (json['manager_id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  employees: (json['employees'] as List<dynamic>?)
      ?.map((e) => EmployeeDataEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OfficeDetailsDataEntityToJson(
  _OfficeDetailsDataEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'lat': instance.lat,
  'lng': instance.lng,
  'radius': instance.radius,
  'manager_id': instance.managerId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'employees': instance.employees?.map((e) => e.toJson()).toList(),
};
