import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/core/usecases/usecase.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class AutoLogin {
  final AuthRepository repository;
  AutoLogin(this.repository);

  ResultFuture<Map<String, dynamic>?> call(NoParams noParams) async =>
      repository.autoLogin();
}

typedef AutoLoginUC = AutoLogin;
