import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/employee/leaves/data/models/leave_model.dart';
import 'package:hr_app/src/features/manager/leaves/domain/entities/set_leave_param.dart';
import '../repositories/repository.dart';

class SetLeaveUC extends UseCase<LeavesModel, SetLeaveParams> {
  final ManagerLeavesRepo repository;
  SetLeaveUC(this.repository);
  @override
  Future<Either<Failure, LeavesModel>> call(SetLeaveParams params) async {
    return await repository.setLeave(params);
  }
}
