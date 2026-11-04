import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leave_params.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';

abstract interface class LeavesRepository {
  ResultFuture<LeavesEntity> getLeaves();
  ResultVoid requestLeave(LeaveParams params);
}

typedef LeavesRepo = LeavesRepository;
