import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/network/network_info.dart';
import 'package:hr_app/src/features/employee/leaves/data/data_sources/remote_src.dart';
import 'package:hr_app/src/features/employee/leaves/data/models/leave_model.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leave_params.dart';
import '../../domain/repositories/repository.dart';

class LeavesRepoImpl implements LeavesRepo {
  final LeavesRemoteDataSrc remoteDataSource;
  final NetworkInfo networkInfo;

  LeavesRepoImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, LeavesModel>> getLeaves() async {
    try {
      final remoteSections = await remoteDataSource.fetchLeaves();
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> requestLeave(LeaveParams params) async {
    try {
      final remoteSections = await remoteDataSource.requestLeave(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
