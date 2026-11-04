import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/manager_leaves/domain/repositories/manager_leaves_repository.dart';

class GetManagerLeaves {
  final ManagerLeavesRepository repository;
  GetManagerLeaves(this.repository);

  ResultFuture<LeavesEntity> call() async => repository.getLeaves();
}

class GetManagerLeavesUseCase extends GetManagerLeaves {
  GetManagerLeavesUseCase(super.repository);
}

typedef GetManagerLeavesUC = GetManagerLeavesUseCase;
