import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/features/employee/leaves/data/models/leave_model.dart';
import 'package:hr_app/src/features/manager/leaves/domain/entities/set_leave_param.dart';

abstract class ManagerLeavesRepo {
  Future<Either<Failure, LeavesModel>> getLeaves();
  Future<Either<Failure, LeavesModel>> setLeave(SetLeaveParams params);
}
