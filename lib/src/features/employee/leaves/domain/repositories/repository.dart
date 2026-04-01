import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/features/employee/leaves/data/models/leave_model.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leave_params.dart';

abstract class LeavesRepo {
  Future<Either<Failure, LeavesModel>> getLeaves();
  Future<Either<Failure, void>> requestLeave(LeaveParams params);
}
