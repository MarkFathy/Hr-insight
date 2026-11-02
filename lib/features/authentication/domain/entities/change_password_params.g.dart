// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChangePasswordParams _$ChangePasswordParamsFromJson(
  Map<String, dynamic> json,
) => _ChangePasswordParams(
  oldPassword: json['old_password'] as String,
  password: json['password'] as String,
  passwordConfirmation: json['password_confirmation'] as String,
  isEmployee: json['isEmployee'] as bool?,
  token: json['token'] as String?,
);

Map<String, dynamic> _$ChangePasswordParamsToJson(
  _ChangePasswordParams instance,
) => <String, dynamic>{
  'old_password': instance.oldPassword,
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
  'isEmployee': instance.isEmployee,
  'token': instance.token,
};
