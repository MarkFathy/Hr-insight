import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/employee/leaves/domain/repositories/repository.dart';

class GetLeavesUC {
  final LeavesRepo repository;
  GetLeavesUC(this.repository);

  ResultFuture<LeavesEntity> call() async => repository.getLeaves();
}
