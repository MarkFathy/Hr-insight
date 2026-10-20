import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_delete_params.freezed.dart';
part 'account_delete_params.g.dart';

@freezed
abstract class AccountDeleteParams with _$AccountDeleteParams {
  const factory AccountDeleteParams({
    required String password,
    @Default(true) bool isEmployee,
  }) = _AccountDeleteParams;

  factory AccountDeleteParams.fromJson(Map<String, dynamic> json) =>
      _$AccountDeleteParamsFromJson(json);
}
