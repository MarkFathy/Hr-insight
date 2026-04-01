import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/features/profile/data/models/employee_profile_model.dart';
import 'package:hr_app/src/features/profile/domain/entities/update_profile_params.dart';

abstract class ProfileRepo {
  Future<Either<Failure, String>> getProfile(bool isEmployee);
  Future<Either<Failure, EmployeeProfileModel>> updateProfile(
      UpdateProfileParams params);
}
