import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manager_entity.freezed.dart';
part 'manager_entity.g.dart';

@freezed
abstract class ManagerEntity with _$ManagerEntity {
  const ManagerEntity._();

  const factory ManagerEntity({
    int? status,
    String? message,
    TokenDataEntity? data,
  }) = _ManagerEntity;

  factory ManagerEntity.fromJson(Map<String, dynamic> json) =>
      _$ManagerEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory ManagerEntity.fromMap(Map<String, dynamic> map) =>
      ManagerEntity.fromJson(map);

  static ManagerEntity fromRawJson(String str) =>
      ManagerEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}

@freezed
abstract class TokenDataEntity with _$TokenDataEntity {
  const TokenDataEntity._();

  const factory TokenDataEntity({
    String? token,
    @JsonKey(name: 'data') ManagerDataEntity? manager,
  }) = _TokenDataEntity;

  factory TokenDataEntity.fromJson(Map<String, dynamic> json) =>
      _$TokenDataEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory TokenDataEntity.fromMap(Map<String, dynamic> map) =>
      TokenDataEntity.fromJson(map);

  static TokenDataEntity fromRawJson(String str) =>
      TokenDataEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}

@freezed
abstract class ManagerDataEntity with _$ManagerDataEntity {
  const ManagerDataEntity._();

  const factory ManagerDataEntity({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? image,
    String? pin,
    String? status,
    String? company,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ManagerDataEntity;

  factory ManagerDataEntity.fromJson(Map<String, dynamic> json) =>
      _$ManagerDataEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory ManagerDataEntity.fromMap(Map<String, dynamic> map) =>
      ManagerDataEntity.fromJson(map);

  static ManagerDataEntity fromRawJson(String str) =>
      ManagerDataEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}
