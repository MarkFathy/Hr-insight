part of 'bloc.dart';

abstract class OfficesEvent extends Equatable {
  const OfficesEvent();

  @override
  List<Object> get props => [];
}

class GetOfficesEvent extends OfficesEvent {
  const GetOfficesEvent();
  @override
  List<Object> get props => [];
}

class AddOfficeEvent extends OfficesEvent {
  const AddOfficeEvent();
  @override
  List<Object> get props => [];
}

class SetEmployeeEvent extends OfficesEvent {
  final SetEmployeeParams params;

  const SetEmployeeEvent({required this.params});
  @override
  List<Object> get props => [params];
}

class EditOfficeEvent extends OfficesEvent {
  final int id;

  const EditOfficeEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class DeleteOfficesEvent extends OfficesEvent {
  final int id;
  const DeleteOfficesEvent(this.id);
  @override
  List<Object> get props => [id];
}

class GetOfficeDetailsEvent extends OfficesEvent {
  final int id;
  const GetOfficeDetailsEvent(this.id);
  @override
  List<Object> get props => [id];
}
