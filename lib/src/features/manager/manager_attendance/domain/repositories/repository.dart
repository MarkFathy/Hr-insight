import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_model.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_params.dart';

abstract class ManagerAttendanceRepo {
  Future<Either<Failure, ManagerAttendanceModel>> getManagerAttendance(
      ManagerAttendanceParams params);
}
