import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_params.freezed.dart';
part 'forget_password_params.g.dart';

@freezed
abstract class ForgetPasswordParams with _$ForgetPasswordParams {
  const factory ForgetPasswordParams({
    required String email,
    required bool isEmployee,
  }) = _ForgetPasswordParams;

  factory ForgetPasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordParamsFromJson(json);
}
