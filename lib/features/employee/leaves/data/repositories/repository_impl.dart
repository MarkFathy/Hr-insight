import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/errors/app_failure.dart';
import 'package:hr_app/core/errors/exceptions.dart';
import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee/leaves/data/data_sources/remote_src.dart';
import 'package:hr_app/features/employee/leaves/domain/entities/leave_params.dart';
import 'package:hr_app/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/employee/leaves/domain/repositories/repository.dart';

class LeavesRepoImpl implements LeavesRepo {
  final LeavesRemoteDataSrc remoteDataSource;

  LeavesRepoImpl({required this.remoteDataSource});

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
