// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyParams _$VerifyParamsFromJson(Map<String, dynamic> json) =>
    _VerifyParams(
      otp: json['otp'] as String,
      email: json['email'] as String,
      isEmployee: json['isEmployee'] as bool,
    );

Map<String, dynamic> _$VerifyParamsToJson(_VerifyParams instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'email': instance.email,
      'isEmployee': instance.isEmployee,
    };
