part of 'bloc.dart';

abstract class ManagerLeavesState extends Equatable {
  const ManagerLeavesState();

  @override
  List<Object> get props => [];
}

class ManagerLeavesInitialState extends ManagerLeavesState {}

class ManagerLeavesLoadingState extends ManagerLeavesState {}

class ManagerLeavesLoadedState extends ManagerLeavesState {
  final LeavesModel leaves;

  const ManagerLeavesLoadedState({required this.leaves});

  @override
  List<Object> get props => [leaves];
}

class ManagerLeaveSentState extends ManagerLeavesState {}

class LeavesErrorState extends ManagerLeavesState {
  final String message;

  const LeavesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
