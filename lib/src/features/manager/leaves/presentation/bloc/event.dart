part of 'bloc.dart';

abstract class ManagerLeavesEvent extends Equatable {
  const ManagerLeavesEvent();

  @override
  List<Object> get props => [];
}

class GetManagerLeavesEvent extends ManagerLeavesEvent {
  @override
  List<Object> get props => [];
}

class SetLeaveEvent extends ManagerLeavesEvent {
  final SetLeaveParams params;
  const SetLeaveEvent(this.params);
  @override
  List<Object> get props => [];
}
