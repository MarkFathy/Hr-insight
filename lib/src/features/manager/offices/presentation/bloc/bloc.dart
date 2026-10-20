import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/add_office_use_case.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/delete_office_use_case.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/edit_office_use_case.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/get_office_details_use_case.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/get_offices_use_case.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/set_office_use_case.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/event.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/state.dart';
import 'package:latlong2/latlong.dart';

export 'event.dart';
export 'state.dart';

class OfficesBloc extends Bloc<OfficesEvent, OfficesState> {
  final GetOfficesUC getOfficesUC;
  final AddOfficeUC addOfficeUC;
  final EditOfficeUC editOfficeUC;
  final DeleteOfficeUC deleteOfficeUC;
  final GetOfficeDetailsUC getOfficeDetailsUC;
  final SetOfficeUC setOffice;

  OfficesBloc({
    required this.getOfficesUC,
    required this.addOfficeUC,
    required this.deleteOfficeUC,
    required this.editOfficeUC,
    required this.getOfficeDetailsUC,
    required this.setOffice,
  }) : super(const OfficesState.initial()) {
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
    GetOfficesEvent event,
    Emitter<OfficesState> emit,
  ) async {
    emit(const OfficesState.loading());
    final failureOrSections = await getOfficesUC.call();
    emit(
      failureOrSections.fold(
        (failure) => OfficesState.error(message: failure.message),
        (result) {
          offices = result;
          return OfficesState.loaded(offices: result);
        },
      ),
    );
  }

  FutureOr<void> _setEmployee(
    SetEmployeeEvent event,
    Emitter<OfficesState> emit,
  ) async {
    emit(const OfficesState.loading());
    final failureOrSections = await setOffice.call(event.params);
    emit(
      failureOrSections.fold(
        (failure) => OfficesState.error(message: failure.message),
        (result) => OfficesState.modified(message: result),
      ),
    );
  }

  FutureOr<void> _addOffice(
    AddOfficeEvent event,
    Emitter<OfficesState> emit,
  ) async {
    emit(const OfficesState.loading());
    final rawRadius = double.tryParse(radiusCtrl.text.trim()) ?? 0.0;
    final roundedRadius = double.parse(rawRadius.toStringAsFixed(2));
    final radiusVal = double.parse((roundedRadius + 1700).toStringAsFixed(2));
    final failureOrSections = await addOfficeUC.call(
      OfficeParams(
        name: nameCtrl.text,
        lat: location!.latitude,
        lng: location!.longitude,
        radius: radiusVal,
      ),
    );
    emit(
      failureOrSections.fold(
        (failure) => OfficesState.error(message: failure.message),
        (result) {
          offices = result;
          return const OfficesState.modified();
        },
      ),
    );
  }

  FutureOr<void> _editOffice(
    EditOfficeEvent event,
    Emitter<OfficesState> emit,
  ) async {
    emit(const OfficesState.loading());
    final rawRadius = double.tryParse(radiusCtrl.text.trim()) ?? 0.0;
    final roundedRadius = double.parse(rawRadius.toStringAsFixed(2));
    final radiusVal = double.parse((roundedRadius + 1700).toStringAsFixed(2));
    final failureOrSections = await editOfficeUC.call(
      OfficeParams(
        id: event.id,
        name: nameCtrl.text,
        lat: location!.latitude,
        lng: location!.longitude,
        radius: radiusVal,
      ),
    );
    emit(
      failureOrSections.fold(
        (failure) => OfficesState.error(message: failure.message),
        (result) {
          offices = result;
          return const OfficesState.modified();
        },
      ),
    );
  }

  FutureOr<void> _getOfficeDetails(
    GetOfficeDetailsEvent event,
    Emitter<OfficesState> emit,
  ) async {
    emit(const OfficesState.loading());
    final failureOrSections = await getOfficeDetailsUC.call(event.id);
    emit(
      failureOrSections.fold(
        (failure) => OfficesState.error(message: failure.message),
        (result) => OfficesState.officeDetailsLoaded(details: result),
      ),
    );
  }

  FutureOr<void> _deleteOffice(
    DeleteOfficesEvent event,
    Emitter<OfficesState> emit,
  ) async {
    emit(const OfficesState.loading());
    final failureOrSections = await deleteOfficeUC.call(event.id);
    emit(
      failureOrSections.fold(
        (failure) => OfficesState.error(message: failure.message),
        (result) {
          offices = result;
          return const OfficesState.modified();
        },
      ),
    );
  }

  @override
  Future<void> close() {
    nameCtrl.dispose();
    radiusCtrl.dispose();
    return super.close();
  }
}
