import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/features/manager_offices/domain/entities/office_params.dart';
import 'package:hr_app/features/manager_offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/add_office.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/delete_office.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/edit_office.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/get_office_details.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/get_offices.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/set_employee_office.dart';
import 'package:hr_app/features/manager_offices/presentation/bloc/offices_event.dart';
import 'package:hr_app/features/manager_offices/presentation/bloc/offices_state.dart';
import 'package:latlong2/latlong.dart';

export 'offices_event.dart';
export 'offices_state.dart';

class OfficesBloc extends Bloc<OfficesEvent, OfficesState> {
  final GetOffices getOffices;
  final AddOffice addOffice;
  final EditOffice editOffice;
  final DeleteOffice deleteOffice;
  final GetOfficeDetails getOfficeDetails;
  final SetEmployeeOffice setEmployeeOffice;

  OfficesBloc({
    GetOffices? getOffices,
    GetOffices? getOfficesUC,
    AddOffice? addOffice,
    AddOffice? addOfficeUC,
    EditOffice? editOffice,
    EditOffice? editOfficeUC,
    DeleteOffice? deleteOffice,
    DeleteOffice? deleteOfficeUC,
    GetOfficeDetails? getOfficeDetails,
    GetOfficeDetails? getOfficeDetailsUC,
    SetEmployeeOffice? setEmployeeOffice,
    SetEmployeeOffice? setOffice,
  }) : getOffices = getOffices ?? getOfficesUC!,
       addOffice = addOffice ?? addOfficeUC!,
       editOffice = editOffice ?? editOfficeUC!,
       deleteOffice = deleteOffice ?? deleteOfficeUC!,
       getOfficeDetails = getOfficeDetails ?? getOfficeDetailsUC!,
       setEmployeeOffice = setEmployeeOffice ?? setOffice!,
       super(const OfficesState.initial()) {
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
    final failureOrSections = await getOffices.call();
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
    final failureOrSections = await setEmployeeOffice.call(event.params);
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
    final OfficeParams params;
    if (event.params != null) {
      params = event.params!;
    } else {
      final rawRadius = double.tryParse(radiusCtrl.text.trim()) ?? 0.0;
      final roundedRadius = double.parse(rawRadius.toStringAsFixed(2));
      final radiusVal = double.parse((roundedRadius + 1700).toStringAsFixed(2));
      params = OfficeParams(
        name: nameCtrl.text,
        lat: location!.latitude,
        lng: location!.longitude,
        radius: radiusVal,
      );
    }
    final failureOrSections = await addOffice.call(params);
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
    final OfficeParams params;
    if (event.params != null) {
      params = event.params!;
    } else {
      final rawRadius = double.tryParse(radiusCtrl.text.trim()) ?? 0.0;
      final roundedRadius = double.parse(rawRadius.toStringAsFixed(2));
      final radiusVal = double.parse((roundedRadius + 1700).toStringAsFixed(2));
      params = OfficeParams(
        id: event.id,
        name: nameCtrl.text,
        lat: location!.latitude,
        lng: location!.longitude,
        radius: radiusVal,
      );
    }
    final failureOrSections = await editOffice.call(params);
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
    final failureOrSections = await getOfficeDetails.call(event.id);
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
    final failureOrSections = await deleteOffice.call(event.id);
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
