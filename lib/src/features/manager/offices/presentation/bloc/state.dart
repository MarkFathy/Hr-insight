part of 'bloc.dart';

abstract class OfficesState extends Equatable {
  const OfficesState();

  @override
  List<Object> get props => [];
}

class OfficesInitialState extends OfficesState {}

class OfficesLoadingState extends OfficesState {}

class OfficesLoadedState extends OfficesState {
  final OfficesEntity offices;

  const OfficesLoadedState({required this.offices});

  @override
  List<Object> get props => [offices];
}

class OfficeDetailsLoadedState extends OfficesState {
  final OfficeDetailsEntity details;

  const OfficeDetailsLoadedState({required this.details});

  @override
  List<Object> get props => [details];
}

class OfficesModifiedState extends OfficesState {
  final String? message;

  const OfficesModifiedState({this.message});
}

class OfficesErrorState extends OfficesState {
  final String message;

  const OfficesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
