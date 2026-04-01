part of 'bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfileEvent extends ProfileEvent {
  final bool isEmployee;

  const GetProfileEvent({required this.isEmployee});
  @override
  List<Object> get props => [isEmployee];
}

class UpdateProfileEvent extends ProfileEvent {
  final UpdateProfileParams params;
  const UpdateProfileEvent(this.params);
  @override
  List<Object> get props => [params];
}
