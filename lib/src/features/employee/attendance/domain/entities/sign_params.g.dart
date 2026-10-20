// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignParams _$SignParamsFromJson(Map<String, dynamic> json) => _SignParams(
  isAttend: json['isAttend'] as bool,
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
);

Map<String, dynamic> _$SignParamsToJson(_SignParams instance) =>
    <String, dynamic>{
      'isAttend': instance.isAttend,
      'lat': instance.lat,
      'lng': instance.lng,
    };
