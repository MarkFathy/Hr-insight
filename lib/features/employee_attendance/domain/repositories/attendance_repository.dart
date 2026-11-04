import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/sign_entity.dart';

abstract interface class AttendanceRepository {
  ResultFuture<AttendanceEntity> getAttendance();
  ResultFuture<SignEntity> sign({
    required bool isAttend,
    int? attendanceId,
    String? date,
  });
}

typedef AttendanceRepo = AttendanceRepository;
