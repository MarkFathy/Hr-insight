// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManagerAttendanceParams _$ManagerAttendanceParamsFromJson(
  Map<String, dynamic> json,
) => _ManagerAttendanceParams(
  employeeId: json['employee_id'] as String,
  date: DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$ManagerAttendanceParamsToJson(
  _ManagerAttendanceParams instance,
) => <String, dynamic>{
  'employee_id': instance.employeeId,
  'date': instance.date.toIso8601String(),
};
