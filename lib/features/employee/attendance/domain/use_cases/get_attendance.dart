import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/employee/attendance/domain/repositories/repository.dart';

class GetAttendanceUC {
  final AttendanceRepo repository;
  GetAttendanceUC(this.repository);

  ResultFuture<AttendanceEntity> call() async => repository.getAttendance();
}
