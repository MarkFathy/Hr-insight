// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForgetPasswordParams _$ForgetPasswordParamsFromJson(
  Map<String, dynamic> json,
) => _ForgetPasswordParams(
  email: json['email'] as String,
  isEmployee: json['isEmployee'] as bool,
);

Map<String, dynamic> _$ForgetPasswordParamsToJson(
  _ForgetPasswordParams instance,
) => <String, dynamic>{
  'email': instance.email,
  'isEmployee': instance.isEmployee,
};
