import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_model.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_params.dart';
import '../repositories/repository.dart';

class GetManagerAttendanceUC
    extends UseCase<ManagerAttendanceModel, ManagerAttendanceParams> {
  final ManagerAttendanceRepo repository;
  GetManagerAttendanceUC(this.repository);
  @override
  Future<Either<Failure, ManagerAttendanceModel>> call(
      ManagerAttendanceParams params) async {
    return await repository.getManagerAttendance(params);
  }
}
