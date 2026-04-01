part of 'bloc.dart';

abstract class LeavesState extends Equatable {
  const LeavesState();

  @override
  List<Object> get props => [];
}

class LeavesInitialState extends LeavesState {}

class LeavesLoadingState extends LeavesState {}

class LeavesLoadedState extends LeavesState {
  final LeavesModel leaves;

  const LeavesLoadedState({required this.leaves});

  @override
  List<Object> get props => [leaves];
}

class LeaveSentState extends LeavesState {}

class LeavesErrorState extends LeavesState {
  final String message;

  const LeavesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
