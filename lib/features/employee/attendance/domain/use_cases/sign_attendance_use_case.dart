import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee/attendance/domain/entities/sign_entity.dart';
import 'package:hr_app/features/employee/attendance/domain/repositories/repository.dart';

class SignAttendanceUseCase {
  final AttendanceRepo repository;
  SignAttendanceUseCase(this.repository);

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

typedef SignUC = SignAttendanceUseCase;
