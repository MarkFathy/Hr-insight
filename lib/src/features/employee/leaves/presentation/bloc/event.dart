part of 'bloc.dart';

abstract class LeavesEvent extends Equatable {
  const LeavesEvent();

  @override
  List<Object> get props => [];
}

class GetLeavesEvent extends LeavesEvent {
  @override
  List<Object> get props => [];
}

class RequestLeaveEvent extends LeavesEvent {
  const RequestLeaveEvent();
  @override
  List<Object> get props => [];
}
