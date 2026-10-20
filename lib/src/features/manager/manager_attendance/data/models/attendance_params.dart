import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'attendance_params.freezed.dart';
part 'attendance_params.g.dart';

@freezed
abstract class ManagerAttendanceParams with _$ManagerAttendanceParams {
  const ManagerAttendanceParams._();

  const factory ManagerAttendanceParams({
    @JsonKey(name: 'employee_id') required String employeeId,
    required DateTime date,
  }) = _ManagerAttendanceParams;

  factory ManagerAttendanceParams.fromJson(Map<String, dynamic> json) =>
      _$ManagerAttendanceParamsFromJson(json);

  Map<String, dynamic> toMap() => {
    'employee_id': employeeId,
    'date': DateFormat('yyyy-MM-dd').format(date),
  };

  factory ManagerAttendanceParams.fromMap(Map<String, dynamic> map) =>
      ManagerAttendanceParams(
        employeeId: map['employee_id'] as String,
        date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      );
}
