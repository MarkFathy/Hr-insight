import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/profile/data/models/employee_profile_model.dart';
import 'package:hr_app/src/features/profile/domain/entities/update_profile_params.dart';
import '../repositories/repository.dart';

class UpdateProfileUC
    extends UseCase<EmployeeProfileModel, UpdateProfileParams> {
  final ProfileRepo repository;
  UpdateProfileUC(this.repository);
  @override
  Future<Either<Failure, EmployeeProfileModel>> call(
      UpdateProfileParams params) async {
    return await repository.updateProfile(params);
  }
}
