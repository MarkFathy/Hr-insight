import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/profile/data/models/employee_profile_model.dart';
import 'package:hr_app/features/profile/domain/entities/update_profile_params.dart';
import 'package:hr_app/features/profile/domain/repositories/profile_repository.dart';

class UpdateProfile {
  final ProfileRepository repository;
  UpdateProfile(this.repository);

  ResultFuture<EmployeeProfileModel> call(UpdateProfileParams params) async =>
      repository.updateProfile(params);
}

typedef UpdateProfileUC = UpdateProfile;
