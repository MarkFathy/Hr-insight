import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/network/network_info.dart';
import 'package:hr_app/src/features/employee/attendance/data/data_sources/remote_src.dart';
import 'package:hr_app/src/features/employee/attendance/data/models/attendance_model.dart';
import 'package:hr_app/src/features/employee/attendance/domain/entities/sign_entity.dart';
import '../../domain/repositories/repository.dart';

class AttendanceRepoImpl implements AttendanceRepo {
  final AttendanceRemoteDataSrc remoteDataSource;
  final NetworkInfo networkInfo;

  AttendanceRepoImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, AttendanceModel>> getAttendance() async {
    try {
      final remoteSections = await remoteDataSource.fetchAttendance();
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, SignEntity>> sign(bool params) async {
    try {
      final remoteSections = await remoteDataSource.sign(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
