import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/network/network_info.dart';
import 'package:hr_app/src/features/profile/data/data_sources/remote_src.dart';
import 'package:hr_app/src/features/profile/data/models/employee_profile_model.dart';
import 'package:hr_app/src/features/profile/domain/entities/update_profile_params.dart';
import '../../domain/repositories/repository.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSrc remoteDataSource;
  final NetworkInfo networkInfo;

  ProfileRepoImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, String>> getProfile(bool isEmployee) async {
    try {
      final remoteSections = await remoteDataSource.getProfile(isEmployee);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, EmployeeProfileModel>> updateProfile(
      UpdateProfileParams params) async {
    try {
      final remoteSections = await remoteDataSource.updateProfile(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
