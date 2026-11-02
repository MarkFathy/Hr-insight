import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/errors/app_failure.dart';
import 'package:hr_app/core/errors/exceptions.dart';
import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager/manager_attendance/data/data_sources/remote_src.dart';
import 'package:hr_app/features/manager/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/features/manager/manager_attendance/domain/entities/manager_attendance_entity.dart';
import 'package:hr_app/features/manager/manager_attendance/domain/repositories/repository.dart';

class ManagerAttendanceRepoImpl implements ManagerAttendanceRepo {
  final ManagerAttendanceRemoteDataSrc remoteDataSource;

  ManagerAttendanceRepoImpl({required this.remoteDataSource});

  @override
  ResultFuture<ManagerAttendanceEntity> getManagerAttendance(
    ManagerAttendanceParams params,
  ) async {
    try {
      final remoteSections = await remoteDataSource.fetchAttendance(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }
}
