import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';

part 'manager_profile_model.freezed.dart';
part 'manager_profile_model.g.dart';

@freezed
abstract class ManagerProfileModel with _$ManagerProfileModel {
  const ManagerProfileModel._();

  const factory ManagerProfileModel({
    int? status,
    String? message,
    ManagerDataEntity? data,
  }) = _ManagerProfileModel;

  factory ManagerProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ManagerProfileModelFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory ManagerProfileModel.fromMap(Map<String, dynamic> map) =>
      ManagerProfileModel.fromJson(map);

  static ManagerProfileModel fromRawJson(String str) =>
      ManagerProfileModel.fromJson(json.decode(str) as Map<String, dynamic>);
}
