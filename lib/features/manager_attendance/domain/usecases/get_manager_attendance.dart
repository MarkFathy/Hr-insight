import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/features/manager_attendance/domain/entities/manager_attendance_entity.dart';
import 'package:hr_app/features/manager_attendance/domain/repositories/manager_attendance_repository.dart';

class GetManagerAttendance {
  final ManagerAttendanceRepository repository;
  GetManagerAttendance(this.repository);

  ResultFuture<ManagerAttendanceEntity> call(
    ManagerAttendanceParams params,
  ) async => repository.getManagerAttendance(params);
}

class GetManagerAttendanceUC extends GetManagerAttendance {
  GetManagerAttendanceUC(super.repository);
}
