import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/features/manager/manager_attendance/domain/entities/manager_attendance_entity.dart';

abstract interface class ManagerAttendanceRepo {
  ResultFuture<ManagerAttendanceEntity> getManagerAttendance(
    ManagerAttendanceParams params,
  );
}
