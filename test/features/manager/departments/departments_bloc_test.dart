import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/errors/app_failure.dart';
import 'package:hr_app/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/add_department.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/add_job.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/delete_department.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/delete_job.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/edit_department.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/edit_job.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/get_departments_and_jobs_use_case.dart';
import 'package:hr_app/features/manager/departments/presentation/bloc/bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetDepartmentAndJobssUC extends Mock
    implements GetDepartmentAndJobssUC {}

class MockAddDepartmentUC extends Mock implements AddDepartmentUC {}

class MockEditDepartmentUC extends Mock implements EditDepartmentUC {}

class MockDeleteDepartmentUC extends Mock implements DeleteDepartmentUC {}

class MockAddJobUC extends Mock implements AddJobUC {}

class MockEditJobUC extends Mock implements EditJobUC {}

class MockDeleteJobUC extends Mock implements DeleteJobUC {}

void main() {
  late DepartmentsAndJobsBloc bloc;
  late MockGetDepartmentAndJobssUC mockGetUC;
  late MockAddDepartmentUC mockAddDeptUC;
  late MockEditDepartmentUC mockEditDeptUC;
  late MockDeleteDepartmentUC mockDeleteDeptUC;
  late MockAddJobUC mockAddJobUC;
  late MockEditJobUC mockEditJobUC;
  late MockDeleteJobUC mockDeleteJobUC;

  setUp(() {
    mockGetUC = MockGetDepartmentAndJobssUC();
    mockAddDeptUC = MockAddDepartmentUC();
    mockEditDeptUC = MockEditDepartmentUC();
    mockDeleteDeptUC = MockDeleteDepartmentUC();
    mockAddJobUC = MockAddJobUC();
    mockEditJobUC = MockEditJobUC();
    mockDeleteJobUC = MockDeleteJobUC();

    bloc = DepartmentsAndJobsBloc(
      getDepartmentsAndJobsUC: mockGetUC,
      addDepartmentsUC: mockAddDeptUC,
      deleteOfficeUC: mockDeleteDeptUC,
      editDewpartementsUC: mockEditDeptUC,
      addJobUC: mockAddJobUC,
      deleteJobUC: mockDeleteJobUC,
      editJobUC: mockEditJobUC,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is DepartmentsAndJobsState.initial()', () {
    expect(bloc.state, const DepartmentsAndJobsState.initial());
  });

  group('GetDepartmentsAndJobsEvent', () {
    const tDepartments = DepartmentsEntity(
      status: 200,
      message: 'ok',
      data: [],
    );

    test('emits [loading, loaded] when operation succeeds', () async {
      when(
        () => mockGetUC.call(),
      ).thenAnswer((_) async => const Right(tDepartments));

      final expected = [
        const DepartmentsAndJobsState.loading(),
        const DepartmentsAndJobsState.loaded(departments: tDepartments),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const DepartmentsAndJobsEvent.getDepartmentsAndJobs());
      await expectation;
    });

    test('emits [loading, error] when operation fails', () async {
      when(() => mockGetUC.call()).thenAnswer(
        (_) async => const Left(AppFailure.server(message: 'Server error')),
      );

      final expected = [
        const DepartmentsAndJobsState.loading(),
        const DepartmentsAndJobsState.error(message: 'Server error'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const DepartmentsAndJobsEvent.getDepartmentsAndJobs());
      await expectation;
    });
  });
}
