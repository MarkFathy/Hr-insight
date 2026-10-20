import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_params.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/job_param.dart';
import 'package:hr_app/src/features/manager/departments/domain/use_cases/add_department.dart';
import 'package:hr_app/src/features/manager/departments/domain/use_cases/add_job.dart';
import 'package:hr_app/src/features/manager/departments/domain/use_cases/delete_department.dart';
import 'package:hr_app/src/features/manager/departments/domain/use_cases/delete_job.dart';
import 'package:hr_app/src/features/manager/departments/domain/use_cases/edit_department.dart';
import 'package:hr_app/src/features/manager/departments/domain/use_cases/edit_job.dart';
import 'package:hr_app/src/features/manager/departments/domain/use_cases/get_departments_and_jobs_use_case.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/event.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/state.dart';

export 'event.dart';
export 'state.dart';

class DepartmentsAndJobsBloc
    extends Bloc<DepartmentsAndJobsEvent, DepartmentsAndJobsState> {
  final GetDepartmentAndJobssUC getDepartmentsAndJobsUC;
  final AddDepartmentUC addDepartmentsUC;
  final EditDepartmentUC editDewpartementsUC;
  final DeleteDepartmentUC deleteOfficeUC;
  final AddJobUC addJobUC;
  final EditJobUC editJobUC;
  final DeleteJobUC deleteJobUC;

  DepartmentsAndJobsBloc({
    required this.getDepartmentsAndJobsUC,
    required this.addDepartmentsUC,
    required this.deleteOfficeUC,
    required this.editDewpartementsUC,
    required this.addJobUC,
    required this.deleteJobUC,
    required this.editJobUC,
  }) : super(const DepartmentsAndJobsState.initial()) {
    on<GetDepartmentsAndJobsEvent>(_getDepartmentsAndDepartments);
    on<AddDepartmentEvent>(_addDepartment);
    on<EditDepartmentEvent>(_editDepartment);
    on<DeleteDepartmentsEvent>(_deleteDepartment);
    on<AddJobEvent>(_addJob);
    on<EditJobEvent>(_editJob);
    on<DeleteJobEvent>(_deleteJob);
  }

  DepartmentsEntity? departments;
  final deptNameCtrl = TextEditingController();
  final editDeptNameCtrl = TextEditingController();
  final jobNameCtrl = TextEditingController();
  final jobEditNameCtrl = TextEditingController();
  final deptFormKey = GlobalKey<FormState>();
  final deptEditfFormKey = GlobalKey<FormState>();
  final jobFormKey = GlobalKey<FormState>();
  final jobEditfFormKey = GlobalKey<FormState>();

  FutureOr<void> _getDepartmentsAndDepartments(
    GetDepartmentsAndJobsEvent event,
    Emitter<DepartmentsAndJobsState> emit,
  ) async {
    emit(const DepartmentsAndJobsState.loading());
    final failureOrSections = await getDepartmentsAndJobsUC.call();
    emit(
      failureOrSections.fold(
        (failure) => DepartmentsAndJobsState.error(message: failure.message),
        (result) {
          departments = result;
          return DepartmentsAndJobsState.loaded(departments: result);
        },
      ),
    );
  }

  FutureOr<void> _addDepartment(
    AddDepartmentEvent event,
    Emitter<DepartmentsAndJobsState> emit,
  ) async {
    emit(const DepartmentsAndJobsState.loading());
    final failureOrSections = await addDepartmentsUC.call(deptNameCtrl.text);
    emit(
      failureOrSections.fold(
        (failure) => DepartmentsAndJobsState.error(message: failure.message),
        (result) {
          departments = result;
          return const DepartmentsAndJobsState.modified();
        },
      ),
    );
  }

  FutureOr<void> _editDepartment(
    EditDepartmentEvent event,
    Emitter<DepartmentsAndJobsState> emit,
  ) async {
    emit(const DepartmentsAndJobsState.loading());
    final failureOrSections = await editDewpartementsUC.call(
      DepartmentsParams(name: editDeptNameCtrl.text, id: event.id),
    );
    emit(
      failureOrSections.fold(
        (failure) => DepartmentsAndJobsState.error(message: failure.message),
        (result) {
          departments = result;
          return const DepartmentsAndJobsState.modified();
        },
      ),
    );
  }

  FutureOr<void> _deleteDepartment(
    DeleteDepartmentsEvent event,
    Emitter<DepartmentsAndJobsState> emit,
  ) async {
    emit(const DepartmentsAndJobsState.loading());
    final failureOrSections = await deleteOfficeUC.call(event.id);
    await failureOrSections.fold(
      (failure) async =>
          emit(DepartmentsAndJobsState.error(message: failure.message)),
      (result) async {
        final fresh = await getDepartmentsAndJobsUC.call();
        fresh.fold(
          (failure) {
            departments = result;
            emit(DepartmentsAndJobsState.loaded(departments: result));
          },
          (freshList) {
            departments = freshList;
            emit(DepartmentsAndJobsState.loaded(departments: freshList));
          },
        );
      },
    );
  }

  FutureOr<void> _addJob(
    AddJobEvent event,
    Emitter<DepartmentsAndJobsState> emit,
  ) async {
    emit(const DepartmentsAndJobsState.loading());
    final failureOrSections = await addJobUC.call(
      DepartmentsParams(name: jobNameCtrl.text, id: event.departmentId),
    );
    emit(
      failureOrSections.fold(
        (failure) => DepartmentsAndJobsState.error(message: failure.message),
        (result) {
          departments = result;
          return const DepartmentsAndJobsState.modified();
        },
      ),
    );
  }

  FutureOr<void> _editJob(
    EditJobEvent event,
    Emitter<DepartmentsAndJobsState> emit,
  ) async {
    emit(const DepartmentsAndJobsState.loading());
    final failureOrSections = await editJobUC.call(
      JobParams(
        title: jobEditNameCtrl.text,
        jobId: event.jobId,
        departmentId: event.departmentId,
      ),
    );
    emit(
      failureOrSections.fold(
        (failure) => DepartmentsAndJobsState.error(message: failure.message),
        (result) {
          departments = result;
          return const DepartmentsAndJobsState.modified();
        },
      ),
    );
  }

  FutureOr<void> _deleteJob(
    DeleteJobEvent event,
    Emitter<DepartmentsAndJobsState> emit,
  ) async {
    emit(const DepartmentsAndJobsState.loading());
    final failureOrSections = await deleteJobUC.call(event.id);
    await failureOrSections.fold(
      (failure) async =>
          emit(DepartmentsAndJobsState.error(message: failure.message)),
      (result) async {
        final fresh = await getDepartmentsAndJobsUC.call();
        fresh.fold(
          (failure) {
            departments = result;
            emit(DepartmentsAndJobsState.loaded(departments: result));
          },
          (freshList) {
            departments = freshList;
            emit(DepartmentsAndJobsState.loaded(departments: freshList));
          },
        );
      },
    );
  }

  @override
  Future<void> close() {
    deptNameCtrl.dispose();
    editDeptNameCtrl.dispose();
    jobNameCtrl.dispose();
    jobEditNameCtrl.dispose();
    return super.close();
  }
}
