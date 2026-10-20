import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/src/features/manager/leaves/domain/repositories/repository.dart';

class GetManagerLeavesUC {
  final ManagerLeavesRepo repository;
  GetManagerLeavesUC(this.repository);

  ResultFuture<LeavesEntity> call() async => repository.getLeaves();
}
