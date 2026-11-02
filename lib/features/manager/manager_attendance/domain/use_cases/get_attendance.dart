import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/features/manager/manager_attendance/domain/entities/manager_attendance_entity.dart';
import 'package:hr_app/features/manager/manager_attendance/domain/repositories/repository.dart';

class GetManagerAttendanceUC {
  final ManagerAttendanceRepo repository;
  GetManagerAttendanceUC(this.repository);

  ResultFuture<ManagerAttendanceEntity> call(
    ManagerAttendanceParams params,
  ) async => repository.getManagerAttendance(params);
}
