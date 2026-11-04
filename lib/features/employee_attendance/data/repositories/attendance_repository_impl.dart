import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee_attendance/data/datasources/attendance_remote_data_source.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/sign_entity.dart';
import 'package:hr_app/features/employee_attendance/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDataSource remoteDataSource;

  AttendanceRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<AttendanceEntity> getAttendance() async {
    try {
      final remoteSections = await remoteDataSource.fetchAttendance();
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<SignEntity> sign({
    required bool isAttend,
    int? attendanceId,
    String? date,
  }) async {
    try {
      final remoteSections = await remoteDataSource.sign(
        isAttend: isAttend,
        attendanceId: attendanceId,
        date: date,
      );
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }
}

typedef AttendanceRepoImpl = AttendanceRepositoryImpl;
