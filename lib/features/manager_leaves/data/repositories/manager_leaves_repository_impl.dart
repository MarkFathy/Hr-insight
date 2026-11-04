import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/manager_leaves/data/datasources/manager_leaves_remote_data_source.dart';
import 'package:hr_app/features/manager_leaves/domain/entities/set_leave_param.dart';
import 'package:hr_app/features/manager_leaves/domain/repositories/manager_leaves_repository.dart';

class ManagerLeavesRepositoryImpl implements ManagerLeavesRepository {
  final ManagerLeavesRemoteDataSource remoteDataSource;

  ManagerLeavesRepositoryImpl({required this.remoteDataSource});

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

typedef ManagerLeavesRepoImpl = ManagerLeavesRepositoryImpl;
