part of 'bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final EmployeeProfileModel? employeeProfile;
  final ManagerProfileModel? managerProfile;
  const ProfileLoadedState({this.employeeProfile, this.managerProfile});
}

class ManagerLeaveSentState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String message;

  const ProfileErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
