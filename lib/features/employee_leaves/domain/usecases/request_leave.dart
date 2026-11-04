import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leave_params.dart';
import 'package:hr_app/features/employee_leaves/domain/repositories/leaves_repository.dart';

class RequestLeave {
  final LeavesRepository repository;
  RequestLeave(this.repository);

  ResultVoid call(LeaveParams params) async => repository.requestLeave(params);
}

class RequestLeaveUC extends RequestLeave {
  RequestLeaveUC(super.repository);
}
