import 'package:fpdart/fpdart.dart';
import 'package:hr_app/src/core/errors/app_failure.dart';
import 'package:hr_app/src/core/errors/exceptions.dart';
import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/employee/attendance/data/data_sources/remote_src.dart';
import 'package:hr_app/src/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/src/features/employee/attendance/domain/entities/sign_entity.dart';
import 'package:hr_app/src/features/employee/attendance/domain/repositories/repository.dart';

class AttendanceRepoImpl implements AttendanceRepo {
  final AttendanceRemoteDataSrc remoteDataSource;

  AttendanceRepoImpl({
    required this.remoteDataSource,
  });

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
  ResultFuture<SignEntity> sign({required bool isAttend}) async {
    try {
      final remoteSections = await remoteDataSource.sign(isAttend: isAttend);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }
}
