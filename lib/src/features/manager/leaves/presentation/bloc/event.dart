import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/src/features/manager/leaves/domain/entities/set_leave_param.dart';

part 'event.freezed.dart';

@freezed
sealed class ManagerLeavesEvent with _$ManagerLeavesEvent {
  const factory ManagerLeavesEvent.getLeaves() = GetManagerLeavesEvent;
  const factory ManagerLeavesEvent.setLeave(SetLeaveParams params) =
      SetLeaveEvent;
}
