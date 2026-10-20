import 'package:fpdart/fpdart.dart';
import 'package:hr_app/src/core/errors/app_failure.dart';
import 'package:hr_app/src/core/errors/exceptions.dart';
import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/profile/data/data_sources/remote_src.dart';
import 'package:hr_app/src/features/profile/data/models/employee_profile_model.dart';
import 'package:hr_app/src/features/profile/domain/entities/update_profile_params.dart';
import 'package:hr_app/src/features/profile/domain/repositories/repository.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSrc remoteDataSource;

  ProfileRepoImpl({required this.remoteDataSource});

  @override
  ResultFuture<String> getProfile({required bool isEmployee}) async {
    try {
      final remoteSections =
          await remoteDataSource.getProfile(isEmployee: isEmployee);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    }
  }

  @override
  ResultFuture<EmployeeProfileModel> updateProfile(
    UpdateProfileParams params,
  ) async {
    try {
      final remoteSections = await remoteDataSource.updateProfile(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    }
  }
}
