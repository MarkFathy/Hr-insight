import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_entity.freezed.dart';
part 'sign_entity.g.dart';

@freezed
abstract class SignEntity with _$SignEntity {
  const SignEntity._();

  const factory SignEntity({int? status, String? message, String? data}) =
      _SignEntity;

  factory SignEntity.fromJson(Map<String, dynamic> json) =>
      _$SignEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory SignEntity.fromMap(Map<String, dynamic> map) =>
      SignEntity.fromJson(map);

  static SignEntity fromRawJson(String str) =>
      SignEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}
