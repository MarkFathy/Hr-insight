import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/core/usecases/usecase.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class AutoLoginUC {
  final AuthRepository repository;
  AutoLoginUC(this.repository);

  ResultFuture<Map<String, dynamic>?> call(NoParams noParams) async =>
      repository.autoLogin();
}
