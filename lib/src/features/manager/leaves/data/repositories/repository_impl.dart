import 'package:fpdart/fpdart.dart';
import 'package:hr_app/src/core/errors/app_failure.dart';
import 'package:hr_app/src/core/errors/exceptions.dart';
import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/src/features/manager/leaves/data/data_sources/remote_src.dart';
import 'package:hr_app/src/features/manager/leaves/domain/entities/set_leave_param.dart';
import 'package:hr_app/src/features/manager/leaves/domain/repositories/repository.dart';

class ManagerLeavesRepoImpl implements ManagerLeavesRepo {
  final ManagerLeavesRemoteDataSrc remoteDataSource;

  ManagerLeavesRepoImpl({
    required this.remoteDataSource,
  });

  @override
  ResultFuture<LeavesEntity> getLeaves() async {
    try {
      final remoteSections = await remoteDataSource.fetchLeaves();
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<LeavesEntity> setLeave(SetLeaveParams params) async {
    try {
      final remoteSections = await remoteDataSource.setLeave(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }
}
