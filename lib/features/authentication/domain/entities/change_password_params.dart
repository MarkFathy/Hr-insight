import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_params.freezed.dart';
part 'change_password_params.g.dart';

@freezed
abstract class ChangePasswordParams with _$ChangePasswordParams {
  const ChangePasswordParams._();

  const factory ChangePasswordParams({
    @JsonKey(name: 'old_password') required String oldPassword, required String password, @JsonKey(name: 'password_confirmation')
    required String passwordConfirmation, bool? isEmployee,
    String? token,
  }) = _ChangePasswordParams;

  factory ChangePasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordParamsFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory ChangePasswordParams.fromMap(Map<String, dynamic> map) =>
      ChangePasswordParams.fromJson(map);
}
