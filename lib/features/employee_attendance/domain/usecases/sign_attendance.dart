import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/sign_entity.dart';
import 'package:hr_app/features/employee_attendance/domain/repositories/attendance_repository.dart';

class SignAttendance {
  final AttendanceRepository repository;
  SignAttendance(this.repository);

  ResultFuture<SignEntity> call({
    required bool isAttend,
    int? attendanceId,
    String? date,
  }) async => repository.sign(
    isAttend: isAttend,
    attendanceId: attendanceId,
    date: date,
  );
}

class SignAttendanceUseCase extends SignAttendance {
  SignAttendanceUseCase(super.repository);
}

class SignUC extends SignAttendance {
  SignUC(super.repository);
}
