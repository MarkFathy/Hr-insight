import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:hr_app/features/profile/data/models/employee_profile_model.dart';
import 'package:hr_app/features/profile/domain/entities/update_profile_params.dart';
import 'package:hr_app/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<String> getProfile({required bool isEmployee}) async {
    try {
      final remoteSections = await remoteDataSource.getProfile(
        isEmployee: isEmployee,
      );
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

typedef ProfileRepoImpl = ProfileRepositoryImpl;
