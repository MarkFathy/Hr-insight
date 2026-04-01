import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';

class ManagerProfileModel extends Equatable {
  final int? status;
  final String? message;
  final ManagerDataEntity? data;
  const ManagerProfileModel({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }

  factory ManagerProfileModel.fromMap(Map<String, dynamic> map) {
    return ManagerProfileModel(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? ManagerDataEntity.fromJson(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ManagerProfileModel.fromJson(String source) =>
      ManagerProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
