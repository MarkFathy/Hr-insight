import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_info_entity.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class GetManagerDepartments {
  final AuthRepository repository;
  GetManagerDepartments(this.repository);

  ResultFuture<ManagerInfoEntity?> call(String params) async =>
      repository.getDepartments(params);
}

typedef GetManagerDepartmentsUC = GetManagerDepartments;
