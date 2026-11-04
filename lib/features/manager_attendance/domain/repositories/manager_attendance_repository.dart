import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/features/manager_attendance/domain/entities/manager_attendance_entity.dart';

abstract interface class ManagerAttendanceRepository {
  ResultFuture<ManagerAttendanceEntity> getManagerAttendance(
    ManagerAttendanceParams params,
  );
}

typedef ManagerAttendanceRepo = ManagerAttendanceRepository;
