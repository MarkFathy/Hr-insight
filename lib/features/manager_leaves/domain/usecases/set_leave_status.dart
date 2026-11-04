import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/manager_leaves/domain/entities/set_leave_param.dart';
import 'package:hr_app/features/manager_leaves/domain/repositories/manager_leaves_repository.dart';

class SetLeaveStatus {
  final ManagerLeavesRepository repository;
  SetLeaveStatus(this.repository);

  ResultFuture<LeavesEntity> call(SetLeaveParams params) async =>
      repository.setLeave(params);
}

class SetLeaveStatusUseCase extends SetLeaveStatus {
  SetLeaveStatusUseCase(super.repository);
}

typedef SetLeaveUC = SetLeaveStatusUseCase;
