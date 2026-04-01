part of 'bloc.dart';

abstract class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

class AttendanceInitialState extends AttendanceState {}

class AttendanceLoadingState extends AttendanceState {}

class AttendanceLoadedState extends AttendanceState {
  final AttendanceModel attendance;

  const AttendanceLoadedState({required this.attendance});

  @override
  List<Object> get props => [attendance];
}

class AttendanceSignedState extends AttendanceState {
  final String message;

  const AttendanceSignedState({required this.message});

  @override
  List<Object> get props => [message];
}

class AttendanceErrorState extends AttendanceState {
  final String message;

  const AttendanceErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
