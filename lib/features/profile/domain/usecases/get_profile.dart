import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/profile/domain/repositories/profile_repository.dart';

class GetProfile {
  final ProfileRepository repository;
  GetProfile(this.repository);

  ResultFuture<String> call({required bool isEmployee}) async =>
      repository.getProfile(isEmployee: isEmployee);
}

typedef GetProfileUC = GetProfile;
