// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class ManagerAttendanceParams extends Equatable {
  final String employeeId;
  final DateTime date;

  const ManagerAttendanceParams({required this.employeeId, required this.date});

  @override
  List<Object?> get props => [employeeId, date];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employee_id': employeeId,
      'date': DateFormat('yyyy-MM-dd').format(date),
    };
  }

  factory ManagerAttendanceParams.fromMap(Map<String, dynamic> map) {
    return ManagerAttendanceParams(
      employeeId: map['employee_id'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ManagerAttendanceParams.fromJson(String source) =>
      ManagerAttendanceParams.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
