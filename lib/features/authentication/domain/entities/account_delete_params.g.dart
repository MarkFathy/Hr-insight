// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_delete_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountDeleteParams _$AccountDeleteParamsFromJson(Map<String, dynamic> json) =>
    _AccountDeleteParams(
      password: json['password'] as String,
      isEmployee: json['isEmployee'] as bool? ?? true,
    );

Map<String, dynamic> _$AccountDeleteParamsToJson(
  _AccountDeleteParams instance,
) => <String, dynamic>{
  'password': instance.password,
  'isEmployee': instance.isEmployee,
};
