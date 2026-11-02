import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/profile/domain/repositories/repository.dart';

class GetProfileUC {
  final ProfileRepo repository;
  GetProfileUC(this.repository);

  ResultFuture<String> call({required bool isEmployee}) async =>
      repository.getProfile(isEmployee: isEmployee);
}
