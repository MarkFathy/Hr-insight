import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_params.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/add_department.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/add_job.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/delete_department.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/delete_job.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/edit_department.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/edit_job.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/get_departments_and_jobs.dart';
import 'package:hr_app/features/manager_departments/presentation/bloc/departments_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetDepartmentAndJobssUC extends Mock
    implements GetDepartmentAndJobssUC {}

class MockAddDepartmentUC extends Mock implements AddDepartmentUC {}

class MockEditDepartmentUC extends Mock implements EditDepartmentUC {}

class MockDeleteDepartmentUC extends Mock implements DeleteDepartmentUC {}

class MockAddJobUC extends Mock implements AddJobUC {}

class MockEditJobUC extends Mock implements EditJobUC {}

class MockDeleteJobUC extends Mock implements DeleteJobUC {}

class FakeDepartmentsParams extends Fake implements DepartmentsParams {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeDepartmentsParams());
  });

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

  group('AddDepartmentEvent with name', () {
    const tDeptResponse = DepartmentsEntity(
      status: 201,
      message: 'created',
      data: [],
    );

    test(
      'emits [loading, modified] when addDepartment with name succeeds',
      () async {
        when(
          () => mockAddDeptUC.call(any()),
        ).thenAnswer((_) async => const Right(tDeptResponse));

        final expected = [
          const DepartmentsAndJobsState.loading(),
          const DepartmentsAndJobsState.modified(),
        ];

        final expectation = expectLater(bloc.stream, emitsInOrder(expected));

        bloc.add(
          const DepartmentsAndJobsEvent.addDepartment(name: 'Engineering'),
        );
        await expectation;

        verify(() => mockAddDeptUC.call('Engineering')).called(1);
      },
    );
  });

  group('AddJobEvent with title', () {
    const tJobResponse = DepartmentsEntity(
      status: 201,
      message: 'created',
      data: [],
    );

    test('emits [loading, modified] when addJob with title succeeds', () async {
      when(
        () => mockAddJobUC.call(any()),
      ).thenAnswer((_) async => const Right(tJobResponse));

      final expected = [
        const DepartmentsAndJobsState.loading(),
        const DepartmentsAndJobsState.modified(),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(
        const DepartmentsAndJobsEvent.addJob(10, title: 'Flutter Architect'),
      );
      await expectation;

      verify(
        () => mockAddJobUC.call(
          const DepartmentsParams(name: 'Flutter Architect', id: 10),
        ),
      ).called(1);
    });
  });
}
