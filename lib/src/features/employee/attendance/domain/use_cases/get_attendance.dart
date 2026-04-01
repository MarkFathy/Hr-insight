import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/employee/attendance/data/models/attendance_model.dart';
import '../repositories/repository.dart';

class GetAttendanceUC extends UseCase<AttendanceModel, NoParams> {
  final AttendanceRepo repository;
  GetAttendanceUC(this.repository);
  @override
  Future<Either<Failure, AttendanceModel>> call(NoParams params) async {
    return await repository.getAttendance();
  }
}
