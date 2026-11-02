import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee/leaves/domain/entities/leave_params.dart';
import 'package:hr_app/features/employee/leaves/domain/entities/leaves_entity.dart';

abstract interface class LeavesRepo {
  ResultFuture<LeavesEntity> getLeaves();
  ResultVoid requestLeave(LeaveParams params);
}
