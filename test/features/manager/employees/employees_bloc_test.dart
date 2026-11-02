import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/errors/app_failure.dart';
import 'package:hr_app/features/manager/employees/domain/entities/employees_entity.dart';
import 'package:hr_app/features/manager/employees/domain/use_cases/delete_employee_use_case.dart';
import 'package:hr_app/features/manager/employees/domain/use_cases/get_employees_use_case.dart';
import 'package:hr_app/features/manager/employees/presentation/bloc/bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetEmployeesUC extends Mock implements GetEmployeesUC {}

class MockDeleteEmployeeUC extends Mock implements DeleteEmployeeUC {}

void main() {
  late EmployeesBloc bloc;
  late MockGetEmployeesUC mockGetEmployeesUC;
  late MockDeleteEmployeeUC mockDeleteEmployeeUC;

  setUp(() {
    mockGetEmployeesUC = MockGetEmployeesUC();
    mockDeleteEmployeeUC = MockDeleteEmployeeUC();

    bloc = EmployeesBloc(
      getEmployeesUC: mockGetEmployeesUC,
      deleteOfficeUC: mockDeleteEmployeeUC,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is EmployeesState.initial()', () {
    expect(bloc.state, const EmployeesState.initial());
  });

  group('GetEmployeesEvent', () {
    const tEmployees = EmployeesEntity(status: 200, message: 'ok', data: []);

    test('emits [loading, loaded] when getEmployees succeeds', () async {
      when(
        () => mockGetEmployeesUC.call(),
      ).thenAnswer((_) async => const Right(tEmployees));

      final expected = [
        const EmployeesState.loading(),
        const EmployeesState.loaded(employees: tEmployees),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const EmployeesEvent.getEmployees());
      await expectation;
    });

    test('emits [loading, error] when getEmployees fails', () async {
      when(() => mockGetEmployeesUC.call()).thenAnswer(
        (_) async => const Left(AppFailure.server(message: 'Server error')),
      );

      final expected = [
        const EmployeesState.loading(),
        const EmployeesState.error(message: 'Server error'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const EmployeesEvent.getEmployees());
      await expectation;
    });
  });
}
