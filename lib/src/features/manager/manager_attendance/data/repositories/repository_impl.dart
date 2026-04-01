import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/network/network_info.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/data_sources/remote_src.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_model.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_params.dart';
import '../../domain/repositories/repository.dart';

class ManagerAttendanceRepoImpl implements ManagerAttendanceRepo {
  final ManagerAttendanceRemoteDataSrc remoteDataSource;
  final NetworkInfo networkInfo;

  ManagerAttendanceRepoImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, ManagerAttendanceModel>> getManagerAttendance(
      ManagerAttendanceParams params) async {
    try {
      final remoteSections = await remoteDataSource.fetchAttendance(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
