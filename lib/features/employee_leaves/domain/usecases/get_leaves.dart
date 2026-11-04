import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/employee_leaves/domain/repositories/leaves_repository.dart';

class GetLeaves {
  final LeavesRepository repository;
  GetLeaves(this.repository);

  ResultFuture<LeavesEntity> call() async => repository.getLeaves();
}

class GetLeavesUC extends GetLeaves {
  GetLeavesUC(super.repository);
}
