import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_info_entity.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/auth_repository.dart';

class GetManagerDepartmentsUC {
  final AuthRepository repository;
  GetManagerDepartmentsUC(this.repository);

  ResultFuture<ManagerInfoEntity?> call(String params) async => repository.getDepartments(params);
}
