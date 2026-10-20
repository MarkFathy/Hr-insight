import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
sealed class LeavesEvent with _$LeavesEvent {
  const factory LeavesEvent.getLeaves() = GetLeavesEvent;
  const factory LeavesEvent.requestLeave() = RequestLeaveEvent;
}
