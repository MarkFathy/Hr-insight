// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfficeParams _$OfficeParamsFromJson(Map<String, dynamic> json) =>
    _OfficeParams(
      name: json['name'] as String?,
      radius: (json['radius'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OfficeParamsToJson(_OfficeParams instance) =>
    <String, dynamic>{
      'name': instance.name,
      'radius': instance.radius,
      'lat': instance.lat,
      'lng': instance.lng,
      'id': instance.id,
    };
