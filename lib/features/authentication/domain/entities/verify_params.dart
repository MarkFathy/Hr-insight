import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_params.freezed.dart';
part 'verify_params.g.dart';

@freezed
abstract class VerifyParams with _$VerifyParams {
  const VerifyParams._();

  const factory VerifyParams({
    required String otp,
    required String email,
    required bool isEmployee,
  }) = _VerifyParams;

  factory VerifyParams.fromJson(Map<String, dynamic> json) =>
      _$VerifyParamsFromJson(json);

  Map<String, dynamic> toMap() => {'otp': otp, 'email': email};

  factory VerifyParams.fromMap(Map<String, dynamic> map) => VerifyParams(
    otp: map['otp'] as String,
    email: map['email'] as String,
    isEmployee: false,
  );
}
