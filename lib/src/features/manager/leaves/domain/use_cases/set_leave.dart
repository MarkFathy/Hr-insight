import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/src/features/manager/leaves/domain/entities/set_leave_param.dart';
import 'package:hr_app/src/features/manager/leaves/domain/repositories/repository.dart';

class SetLeaveUC {
  final ManagerLeavesRepo repository;
  SetLeaveUC(this.repository);

  ResultFuture<LeavesEntity> call(SetLeaveParams params) async => repository.setLeave(params);
}
