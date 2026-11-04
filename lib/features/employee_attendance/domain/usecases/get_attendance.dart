import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/employee_attendance/domain/repositories/attendance_repository.dart';

class GetAttendance {
  final AttendanceRepository repository;
  GetAttendance(this.repository);

  ResultFuture<AttendanceEntity> call() async => repository.getAttendance();
}

class GetAttendanceUC extends GetAttendance {
  GetAttendanceUC(super.repository);
}
