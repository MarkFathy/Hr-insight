import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_params.freezed.dart';
part 'update_profile_params.g.dart';

@freezed
abstract class UpdateProfileParams with _$UpdateProfileParams {
  const UpdateProfileParams._();

  const factory UpdateProfileParams({
    @JsonKey(name: 'leave_id') int? id,
    bool? status,
  }) = _UpdateProfileParams;

  factory UpdateProfileParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileParamsFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory UpdateProfileParams.fromMap(Map<String, dynamic> map) =>
      UpdateProfileParams.fromJson(map);
}
