import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/src/features/manager/leaves/domain/entities/set_leave_param.dart';

abstract interface class ManagerLeavesRepo {
  ResultFuture<LeavesEntity> getLeaves();
  ResultFuture<LeavesEntity> setLeave(SetLeaveParams params);
}
