// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResetPasswordParams _$ResetPasswordParamsFromJson(Map<String, dynamic> json) =>
    _ResetPasswordParams(
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
      token: json['token'] as String?,
      isEmployee: json['isEmployee'] as bool? ?? true,
    );

Map<String, dynamic> _$ResetPasswordParamsToJson(
  _ResetPasswordParams instance,
) => <String, dynamic>{
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
  'token': instance.token,
  'isEmployee': instance.isEmployee,
};
