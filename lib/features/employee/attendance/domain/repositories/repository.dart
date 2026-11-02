import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/employee/attendance/domain/entities/sign_entity.dart';

abstract interface class AttendanceRepo {
  ResultFuture<AttendanceEntity> getAttendance();
  ResultFuture<SignEntity> sign({required bool isAttend});
}
