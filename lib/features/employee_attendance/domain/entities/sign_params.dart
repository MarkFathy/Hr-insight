import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_params.freezed.dart';
part 'sign_params.g.dart';

@freezed
abstract class SignParams with _$SignParams {
  const SignParams._();

  const factory SignParams({
    required bool isAttend,
    required double lat,
    required double lng,
  }) = _SignParams;

  factory SignParams.fromJson(Map<String, dynamic> json) =>
      _$SignParamsFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory SignParams.fromMap(Map<String, dynamic> map) =>
      SignParams.fromJson(map);
}
