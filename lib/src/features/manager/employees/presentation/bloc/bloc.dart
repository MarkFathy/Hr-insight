import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/employees/domain/entities/employees_entity.dart';
import 'package:hr_app/src/features/manager/employees/domain/use_cases/delete.dart';
import 'package:hr_app/src/features/manager/employees/domain/use_cases/get.dart';
part 'event.dart';
part 'state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  final GetEmployeesUC getEmployeesUC;
  final DeleteEmployeeUC deleteOfficeUC;
  EmployeesBloc({
    required this.getEmployeesUC,
    required this.deleteOfficeUC,
  }) : super(EmployeesInitialState()) {
    on<GetEmployeesEvent>(_getEmployees);
    on<DeleteEmployeeEvent>(_deleteEmployee);
  }
  EmployeesEntity? employees;
  final nameCtrl = TextEditingController();
  final radiusCtrl = TextEditingController();

  LatLng? location;

  FutureOr<void> _getEmployees(
      GetEmployeesEvent event, Emitter<EmployeesState> emit) async {
    emit(EmployeesLoadingState());
    final failureOrSections = await getEmployeesUC.call(NoParams());
    emit(failureOrSections.fold((failure) {
      return EmployeesErrorState(message: failure.message);
    }, (result) {
      employees = result;
      return EmployeesLoadedState(employees: result);
    }));
  }

  // FutureOr<void> _getOfficeDetails(
  //     GetOfficeDetailsEvent event, Emitter<EmployeesState> emit) async {
  //   emit(EmployeesLoadingState());
  //   final failureOrSections = await addOfficeUC.call(OfficeParams(
  //       name: nameCtrl.text,
  //       lat: location!.latitude,
  //       lng: location!.longitude,
  //       radius: double.parse(radiusCtrl.text)));
  //   emit(failureOrSections.fold((failure) {
  //     return EmployeesErrorState(message: failure.message);
  //   }, (result) {
  //     offices = result;
  //     return EmployeesModifiedState();
  //   }));
  // }

  // FutureOr<void> _deleteEmployee(
  //     DeleteEmployeeEvent event, Emitter<EmployeesState> emit) async {
  //   emit(EmployeesLoadingState());
  //   final failureOrSections = await deleteOfficeUC.call(event.id);
  //   emit(failureOrSections.fold((failure) {
  //     return EmployeesErrorState(message: failure.message);
  //   }, (result) {
  //     employees = result;
  //     return const EmployeesModifiedState();
  //   }));
  // }

  FutureOr<void> _deleteEmployee(
      DeleteEmployeeEvent event, Emitter<EmployeesState> emit) async {
    emit(EmployeesLoadingState());
    final failureOrResult = await deleteOfficeUC.call(event.id);
    emit(failureOrResult.fold(
      (failure) => EmployeesErrorState(message: failure.message),
      (result) {
        add(const GetEmployeesEvent());
        return const EmployeesModifiedState(message: 'Employee deleted');
      },
    ));
  }

  // Stream<EmployeesState> mapEventToState(EmployeesEvent event) async* {
  //   if (event is DeleteEmployeeEvent) {
  //     yield EmployeesLoadingState();
  //     final failureOrSuccess = await deleteOfficeUC.call(event.id);
  //     yield failureOrSuccess.fold(
  //       (failure) => EmployeesErrorState(message: failure.message),
  //       (_) => const EmployeesModifiedState(),
  //     );
  //   }
  // }
}
