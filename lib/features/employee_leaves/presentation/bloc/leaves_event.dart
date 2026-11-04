import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leave_params.dart';

part 'leaves_event.freezed.dart';

@freezed
sealed class LeavesEvent with _$LeavesEvent {
  const factory LeavesEvent.getLeaves() = GetLeavesEvent;
  const factory LeavesEvent.requestLeave({LeaveParams? params}) =
      RequestLeaveEvent;
}
