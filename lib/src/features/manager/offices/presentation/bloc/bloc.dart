import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/set_employee_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_details.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/add.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/delete.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/edit.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/get.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/get_details.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/set_office.dart';
part 'event.dart';
part 'state.dart';

class OfficesBloc extends Bloc<OfficesEvent, OfficesState> {
  final GetOfficesUC getOfficesUC;
  final AddOfficeUC addOfficeUC;
  final EditOfficeUC editOfficeUC;
  final DeleteOfficeUC deleteOfficeUC;
  final GetOfficeDetailsUC getOfficeDetailsUC;
  final SetOfficeUC setOffice;

  OfficesBloc(
      {required this.getOfficesUC,
      required this.addOfficeUC,
      required this.deleteOfficeUC,
      required this.editOfficeUC,
      required this.getOfficeDetailsUC,
      required this.setOffice})
      : super(OfficesInitialState()) {
    on<GetOfficesEvent>(_getOffices);
    on<GetOfficeDetailsEvent>(_getOfficeDetails);
    on<AddOfficeEvent>(_addOffice);
    on<EditOfficeEvent>(_editOffice);
    on<DeleteOfficesEvent>(_deleteOffice);
    on<SetEmployeeEvent>(_setEmployee);
  }
  OfficesEntity? offices;
  final nameCtrl = TextEditingController();
  final radiusCtrl = TextEditingController();

  LatLng? location;

  FutureOr<void> _getOffices(
      GetOfficesEvent event, Emitter<OfficesState> emit) async {
    emit(OfficesLoadingState());
    final failureOrSections = await getOfficesUC.call(NoParams());
    emit(failureOrSections.fold((failure) {
      return OfficesErrorState(message: failure.message);
    }, (result) {
      offices = result;
      return OfficesLoadedState(offices: result);
    }));
  }

  FutureOr<void> _setEmployee(
      SetEmployeeEvent event, Emitter<OfficesState> emit) async {
    emit(OfficesLoadingState());
    final failureOrSections = await setOffice.call(event.params);
    emit(failureOrSections.fold((failure) {
      return OfficesErrorState(message: failure.message);
    }, (result) {
      return OfficesModifiedState(message: result);
    }));
  }

  FutureOr<void> _addOffice(
      AddOfficeEvent event, Emitter<OfficesState> emit) async {
    emit(OfficesLoadingState());
    final failureOrSections = await addOfficeUC.call(OfficeParams(
        name: nameCtrl.text,
        lat: location!.latitude,
        lng: location!.longitude,
        radius: double.parse(radiusCtrl.text)));
    emit(failureOrSections.fold((failure) {
      return OfficesErrorState(message: failure.message);
    }, (result) {
      offices = result;
      return const OfficesModifiedState();
    }));
  }

  FutureOr<void> _editOffice(
      EditOfficeEvent event, Emitter<OfficesState> emit) async {
    emit(OfficesLoadingState());
    final failureOrSections = await editOfficeUC.call(OfficeParams(
        id: event.id,
        name: nameCtrl.text,
        lat: location!.latitude,
        lng: location!.longitude,
        radius: double.parse(radiusCtrl.text)));
    emit(failureOrSections.fold((failure) {
      return OfficesErrorState(message: failure.message);
    }, (result) {
      offices = result;
      return const OfficesModifiedState();
    }));
  }

  FutureOr<void> _getOfficeDetails(
      GetOfficeDetailsEvent event, Emitter<OfficesState> emit) async {
    emit(OfficesLoadingState());
    final failureOrSections = await getOfficeDetailsUC.call(event.id);
    emit(failureOrSections.fold((failure) {
      return OfficesErrorState(message: failure.message);
    }, (result) {
      return OfficeDetailsLoadedState(details: result);
    }));
  }

  FutureOr<void> _deleteOffice(
      DeleteOfficesEvent event, Emitter<OfficesState> emit) async {
    emit(OfficesLoadingState());
    final failureOrSections = await deleteOfficeUC.call(event.id);
    emit(failureOrSections.fold((failure) {
      return OfficesErrorState(message: failure.message);
    }, (result) {
      offices = result;
      return const OfficesModifiedState();
    }));
  }
}
