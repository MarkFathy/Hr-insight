import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';

class EmployeeProfileModel extends Equatable {
  final int? status;
  final String? message;
  final EmployeeDataEntity? data;
  const EmployeeProfileModel({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory EmployeeProfileModel.fromMap(Map<String, dynamic> map) {
    return EmployeeProfileModel(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? EmployeeDataEntity.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeProfileModel.fromJson(String source) =>
      EmployeeProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
