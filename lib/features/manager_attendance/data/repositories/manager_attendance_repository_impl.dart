import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_attendance/data/datasources/manager_attendance_remote_data_source.dart';
import 'package:hr_app/features/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/features/manager_attendance/domain/entities/manager_attendance_entity.dart';
import 'package:hr_app/features/manager_attendance/domain/repositories/manager_attendance_repository.dart';

class ManagerAttendanceRepositoryImpl implements ManagerAttendanceRepository {
  final ManagerAttendanceRemoteDataSource remoteDataSource;

  ManagerAttendanceRepositoryImpl({required this.remoteDataSource});

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

typedef ManagerAttendanceRepoImpl = ManagerAttendanceRepositoryImpl;
