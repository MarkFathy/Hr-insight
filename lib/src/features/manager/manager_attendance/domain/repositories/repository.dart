import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/src/features/manager/manager_attendance/domain/entities/manager_attendance_entity.dart';

abstract interface class ManagerAttendanceRepo {
  ResultFuture<ManagerAttendanceEntity> getManagerAttendance(
    ManagerAttendanceParams params,
  );
}
