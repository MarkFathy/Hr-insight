import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/profile/data/models/employee_profile_model.dart';
import 'package:hr_app/src/features/profile/domain/entities/update_profile_params.dart';

abstract class ProfileRepo {
  ResultFuture<String> getProfile({required bool isEmployee});
  ResultFuture<EmployeeProfileModel> updateProfile(UpdateProfileParams params);
}
