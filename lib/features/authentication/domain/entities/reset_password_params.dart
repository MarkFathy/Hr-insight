import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_params.freezed.dart';
part 'reset_password_params.g.dart';

@freezed
abstract class ResetPasswordParams with _$ResetPasswordParams {
  const ResetPasswordParams._();

  const factory ResetPasswordParams({
    required String password,
    @JsonKey(name: 'password_confirmation')
    required String passwordConfirmation,
    String? token,
    @Default(true) bool isEmployee,
  }) = _ResetPasswordParams;

  factory ResetPasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordParamsFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory ResetPasswordParams.fromMap(Map<String, dynamic> map) =>
      ResetPasswordParams.fromJson(map);
}
