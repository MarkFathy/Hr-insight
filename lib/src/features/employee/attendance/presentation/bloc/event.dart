part of 'bloc.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object> get props => [];
}

class GetAttendanceEvent extends AttendanceEvent {
  @override
  List<Object> get props => [];
}

class SignEvent extends AttendanceEvent {
  final bool isAttend;

  const SignEvent({required this.isAttend});
  @override
  List<Object> get props => [isAttend];
}
