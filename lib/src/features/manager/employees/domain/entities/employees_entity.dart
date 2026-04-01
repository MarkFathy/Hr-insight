import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';

class EmployeesEntity extends Equatable {
  final int? status;
  final String? message;
  final List<EmployeeDataEntity>? data;

  const EmployeesEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory EmployeesEntity.fromMap(Map<String, dynamic> map) {
    return EmployeesEntity(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] is List
          ? List<EmployeeDataEntity>.from(
              (map['data'] as List).map<EmployeeDataEntity>(
                (x) => EmployeeDataEntity.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeesEntity.fromJson(String source) =>
      EmployeesEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
