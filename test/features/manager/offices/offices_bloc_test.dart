import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/src/core/errors/app_failure.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/add_office_use_case.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/delete_office_use_case.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/edit_office_use_case.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/get_office_details_use_case.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/get_offices_use_case.dart';
import 'package:hr_app/src/features/manager/offices/domain/use_cases/set_office_use_case.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetOfficesUC extends Mock implements GetOfficesUC {}

class MockAddOfficeUC extends Mock implements AddOfficeUC {}

class MockEditOfficeUC extends Mock implements EditOfficeUC {}

class MockDeleteOfficeUC extends Mock implements DeleteOfficeUC {}

class MockGetOfficeDetailsUC extends Mock implements GetOfficeDetailsUC {}

class MockSetOfficeUC extends Mock implements SetOfficeUC {}

void main() {
  late OfficesBloc bloc;
  late MockGetOfficesUC mockGetOfficesUC;
  late MockAddOfficeUC mockAddOfficeUC;
  late MockEditOfficeUC mockEditOfficeUC;
  late MockDeleteOfficeUC mockDeleteOfficeUC;
  late MockGetOfficeDetailsUC mockGetOfficeDetailsUC;
  late MockSetOfficeUC mockSetOfficeUC;

  setUp(() {
    mockGetOfficesUC = MockGetOfficesUC();
    mockAddOfficeUC = MockAddOfficeUC();
    mockEditOfficeUC = MockEditOfficeUC();
    mockDeleteOfficeUC = MockDeleteOfficeUC();
    mockGetOfficeDetailsUC = MockGetOfficeDetailsUC();
    mockSetOfficeUC = MockSetOfficeUC();

    bloc = OfficesBloc(
      getOfficesUC: mockGetOfficesUC,
      addOfficeUC: mockAddOfficeUC,
      deleteOfficeUC: mockDeleteOfficeUC,
      editOfficeUC: mockEditOfficeUC,
      getOfficeDetailsUC: mockGetOfficeDetailsUC,
      setOffice: mockSetOfficeUC,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is OfficesState.initial()', () {
    expect(bloc.state, const OfficesState.initial());
  });

  group('GetOfficesEvent', () {
    const tOffices = OfficesEntity(status: 200, message: 'success', data: []);

    test('emits [loading, loaded] when getOffices succeeds', () async {
      when(
        () => mockGetOfficesUC.call(),
      ).thenAnswer((_) async => const Right(tOffices));

      final expectedStates = [
        const OfficesState.loading(),
        const OfficesState.loaded(offices: tOffices),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expectedStates));

      bloc.add(const OfficesEvent.getOffices());
      await expectation;
    });

    test('emits [loading, error] when getOffices fails', () async {
      when(() => mockGetOfficesUC.call()).thenAnswer(
        (_) async => const Left(AppFailure.server(message: 'Server error')),
      );

      final expectedStates = [
        const OfficesState.loading(),
        const OfficesState.error(message: 'Server error'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expectedStates));

      bloc.add(const OfficesEvent.getOffices());
      await expectation;
    });
  });
}
