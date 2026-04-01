import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leave_params.dart';
import '../repositories/repository.dart';

class RequestLeaveUC extends UseCase<void, LeaveParams> {
  final LeavesRepo repository;
  RequestLeaveUC(this.repository);
  @override
  Future<Either<Failure, void>> call(LeaveParams params) async {
    return await repository.requestLeave(params);
  }
}
