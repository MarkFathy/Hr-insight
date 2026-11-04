import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/manager_leaves/domain/entities/set_leave_param.dart';

abstract interface class ManagerLeavesRepository {
  ResultFuture<LeavesEntity> getLeaves();
  ResultFuture<LeavesEntity> setLeave(SetLeaveParams params);
}

typedef ManagerLeavesRepo = ManagerLeavesRepository;
