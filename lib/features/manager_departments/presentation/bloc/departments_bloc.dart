import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_params.dart';
import 'package:hr_app/features/manager_departments/domain/entities/job_param.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/add_department.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/add_job.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/delete_department.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/delete_job.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/edit_department.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/edit_job.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/get_departments_and_jobs.dart';
import 'package:hr_app/features/manager_departments/presentation/bloc/departments_event.dart';
import 'package:hr_app/features/manager_departments/presentation/bloc/departments_state.dart';

export 'departments_event.dart';
export 'departments_state.dart';

class DepartmentsBloc extends Bloc<DepartmentsEvent, DepartmentsState> {
  final GetDepartmentsAndJobs getDepartmentsAndJobs;
  final AddDepartment addDepartment;
  final EditDepartment editDepartment;
  final DeleteDepartment deleteDepartment;
  final AddJob addJob;
  final EditJob editJob;
  final DeleteJob deleteJob;

  DepartmentsBloc({
    GetDepartmentsAndJobs? getDepartmentsAndJobs,
    AddDepartment? addDepartment,
    EditDepartment? editDepartment,
    DeleteDepartment? deleteDepartment,
    AddJob? addJob,
    EditJob? editJob,
    DeleteJob? deleteJob,
    GetDepartmentAndJobssUC? getDepartmentsAndJobsUC,
    AddDepartmentUC? addDepartmentsUC,
    EditDepartmentUC? editDewpartementsUC,
    DeleteDepartmentUC? deleteOfficeUC,
    AddJobUC? addJobUC,
    DeleteJobUC? deleteJobUC,
    EditJobUC? editJobUC,
  }) : getDepartmentsAndJobs =
           getDepartmentsAndJobs ?? getDepartmentsAndJobsUC!,
       addDepartment = addDepartment ?? addDepartmentsUC!,
       editDepartment = editDepartment ?? editDewpartementsUC!,
       deleteDepartment = deleteDepartment ?? deleteOfficeUC!,
       addJob = addJob ?? addJobUC!,
       editJob = editJob ?? editJobUC!,
       deleteJob = deleteJob ?? deleteJobUC!,
       super(const DepartmentsState.initial()) {
    on<GetDepartmentsAndJobsEvent>(_getDepartmentsAndDepartments);
    on<AddDepartmentEvent>(_addDepartment);
    on<EditDepartmentEvent>(_editDepartment);
    on<DeleteDepartmentsEvent>(_deleteDepartment);
    on<AddJobEvent>(_addJob);
    on<EditJobEvent>(_editJob);
    on<DeleteJobEvent>(_deleteJob);
  }

  // Legacy getters
  GetDepartmentsAndJobs get getDepartmentsAndJobsUC => getDepartmentsAndJobs;
  AddDepartment get addDepartmentsUC => addDepartment;
  EditDepartment get editDewpartementsUC => editDepartment;
  DeleteDepartment get deleteOfficeUC => deleteDepartment;
  AddJob get addJobUC => addJob;
  EditJob get editJobUC => editJob;
  DeleteJob get deleteJobUC => deleteJob;

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
    Emitter<DepartmentsState> emit,
  ) async {
    emit(const DepartmentsState.loading());
    final failureOrSections = await getDepartmentsAndJobs.call();
    emit(
      failureOrSections.fold(
        (failure) => DepartmentsState.error(message: failure.message),
        (result) {
          departments = result;
          return DepartmentsState.loaded(departments: result);
        },
      ),
    );
  }

  FutureOr<void> _addDepartment(
    AddDepartmentEvent event,
    Emitter<DepartmentsState> emit,
  ) async {
    emit(const DepartmentsState.loading());
    final name = event.name ?? deptNameCtrl.text;
    final failureOrSections = await addDepartment.call(name);
    emit(
      failureOrSections.fold(
        (failure) => DepartmentsState.error(message: failure.message),
        (result) {
          departments = result;
          return const DepartmentsState.modified();
        },
      ),
    );
  }

  FutureOr<void> _editDepartment(
    EditDepartmentEvent event,
    Emitter<DepartmentsState> emit,
  ) async {
    final name = event.name ?? editDeptNameCtrl.text;
    emit(const DepartmentsState.loading());
    final failureOrSections = await editDepartment.call(
      DepartmentsParams(name: name, id: event.id),
    );
    emit(
      failureOrSections.fold(
        (failure) => DepartmentsState.error(message: failure.message),
        (result) {
          departments = result;
          return const DepartmentsState.modified();
        },
      ),
    );
  }

  FutureOr<void> _deleteDepartment(
    DeleteDepartmentsEvent event,
    Emitter<DepartmentsState> emit,
  ) async {
    emit(const DepartmentsState.loading());
    final failureOrSections = await deleteDepartment.call(event.id);
    await failureOrSections.fold(
      (failure) async => emit(DepartmentsState.error(message: failure.message)),
      (result) async {
        final fresh = await getDepartmentsAndJobs.call();
        fresh.fold(
          (failure) {
            departments = result;
            emit(DepartmentsState.loaded(departments: result));
          },
          (freshList) {
            departments = freshList;
            emit(DepartmentsState.loaded(departments: freshList));
          },
        );
      },
    );
  }

  FutureOr<void> _addJob(
    AddJobEvent event,
    Emitter<DepartmentsState> emit,
  ) async {
    emit(const DepartmentsState.loading());
    final title = event.title ?? jobNameCtrl.text;
    final failureOrSections = await addJob.call(
      DepartmentsParams(name: title, id: event.departmentId),
    );
    emit(
      failureOrSections.fold(
        (failure) => DepartmentsState.error(message: failure.message),
        (result) {
          departments = result;
          return const DepartmentsState.modified();
        },
      ),
    );
  }

  FutureOr<void> _editJob(
    EditJobEvent event,
    Emitter<DepartmentsState> emit,
  ) async {
    emit(const DepartmentsState.loading());
    final title = event.title ?? jobEditNameCtrl.text;
    final failureOrSections = await editJob.call(
      JobParams(
        title: title,
        jobId: event.jobId,
        departmentId: event.departmentId,
      ),
    );
    emit(
      failureOrSections.fold(
        (failure) => DepartmentsState.error(message: failure.message),
        (result) {
          departments = result;
          return const DepartmentsState.modified();
        },
      ),
    );
  }

  FutureOr<void> _deleteJob(
    DeleteJobEvent event,
    Emitter<DepartmentsState> emit,
  ) async {
    emit(const DepartmentsState.loading());
    final failureOrSections = await deleteJob.call(event.id);
    await failureOrSections.fold(
      (failure) async => emit(DepartmentsState.error(message: failure.message)),
      (result) async {
        final fresh = await getDepartmentsAndJobs.call();
        fresh.fold(
          (failure) {
            departments = result;
            emit(DepartmentsState.loaded(departments: result));
          },
          (freshList) {
            departments = freshList;
            emit(DepartmentsState.loaded(departments: freshList));
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

typedef DepartmentsAndJobsBloc = DepartmentsBloc;
