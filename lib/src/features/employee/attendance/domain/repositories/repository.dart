import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/features/employee/attendance/data/models/attendance_model.dart';
import 'package:hr_app/src/features/employee/attendance/domain/entities/sign_entity.dart';

abstract class AttendanceRepo {
  Future<Either<Failure, AttendanceModel>> getAttendance();
  Future<Either<Failure, SignEntity>> sign(bool params);
}
