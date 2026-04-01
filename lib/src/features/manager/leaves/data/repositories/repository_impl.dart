import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/network/network_info.dart';
import 'package:hr_app/src/features/employee/leaves/data/models/leave_model.dart';
import 'package:hr_app/src/features/manager/leaves/data/data_sources/remote_src.dart';
import 'package:hr_app/src/features/manager/leaves/domain/entities/set_leave_param.dart';
import '../../domain/repositories/repository.dart';

class ManagerLeavesRepoImpl implements ManagerLeavesRepo {
  final ManagerLeavesRemoteDataSrc remoteDataSource;
  final NetworkInfo networkInfo;

  ManagerLeavesRepoImpl(
      {required this.remoteDataSource, required this.networkInfo});

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
  Future<Either<Failure, LeavesModel>> setLeave(SetLeaveParams params) async {
    try {
      final remoteSections = await remoteDataSource.setLeave(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
