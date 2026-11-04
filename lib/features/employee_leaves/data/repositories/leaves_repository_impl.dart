import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee_leaves/data/datasources/leaves_remote_data_source.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leave_params.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/employee_leaves/domain/repositories/leaves_repository.dart';

class LeavesRepositoryImpl implements LeavesRepository {
  final LeavesRemoteDataSource remoteDataSource;

  LeavesRepositoryImpl({required this.remoteDataSource});

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
  ResultVoid requestLeave(LeaveParams params) async {
    try {
      await remoteDataSource.requestLeave(params);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }
}

typedef LeavesRepoImpl = LeavesRepositoryImpl;
