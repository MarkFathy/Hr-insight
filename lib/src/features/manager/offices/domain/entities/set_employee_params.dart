import 'dart:convert';
import 'package:equatable/equatable.dart';

class SetEmployeeParams extends Equatable {
  final int? officeId;
  final int? jobId;
  final int employeeId;
  const SetEmployeeParams(
      {required this.employeeId, this.officeId, this.jobId});

  @override
  List<Object?> get props => [officeId, employeeId];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'office_id': officeId.toString(),
      'employee_id': employeeId.toString(),
      'job_id': jobId.toString()
    };
  }

  factory SetEmployeeParams.fromMap(Map<String, dynamic> map) {
    return SetEmployeeParams(
      officeId: map['office_id'] as int?,
      employeeId: map['employee_id'] as int,
      jobId: map['job_id'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory SetEmployeeParams.fromJson(String source) =>
      SetEmployeeParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
