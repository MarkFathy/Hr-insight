// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateProfileParams _$UpdateProfileParamsFromJson(Map<String, dynamic> json) =>
    _UpdateProfileParams(
      id: (json['leave_id'] as num?)?.toInt(),
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$UpdateProfileParamsToJson(
  _UpdateProfileParams instance,
) => <String, dynamic>{'leave_id': instance.id, 'status': instance.status};
