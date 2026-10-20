import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leave_params.dart';
import 'package:hr_app/src/features/employee/leaves/domain/repositories/repository.dart';

class RequestLeaveUC {
  final LeavesRepo repository;
  RequestLeaveUC(this.repository);

  ResultVoid call(LeaveParams params) async => repository.requestLeave(params);
}
