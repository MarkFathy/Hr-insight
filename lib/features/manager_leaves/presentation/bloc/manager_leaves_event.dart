import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/manager_leaves/domain/entities/set_leave_param.dart';

part 'manager_leaves_event.freezed.dart';

@freezed
sealed class ManagerLeavesEvent with _$ManagerLeavesEvent {
  const factory ManagerLeavesEvent.getLeaves() = GetManagerLeavesEvent;
  const factory ManagerLeavesEvent.setLeave(SetLeaveParams params) =
      SetLeaveEvent;
}
