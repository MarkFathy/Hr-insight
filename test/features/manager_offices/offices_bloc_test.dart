import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/features/manager_offices/domain/entities/office_params.dart';
import 'package:hr_app/features/manager_offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/add_office.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/delete_office.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/edit_office.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/get_office_details.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/get_offices.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/set_employee_office.dart';
import 'package:hr_app/features/manager_offices/presentation/bloc/offices_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetOfficesUC extends Mock implements GetOfficesUC {}

class MockAddOfficeUC extends Mock implements AddOfficeUC {}

class MockEditOfficeUC extends Mock implements EditOfficeUC {}

class MockDeleteOfficeUC extends Mock implements DeleteOfficeUC {}

class MockGetOfficeDetailsUC extends Mock implements GetOfficeDetailsUC {}

class MockSetOfficeUC extends Mock implements SetOfficeUC {}

class FakeOfficeParams extends Fake implements OfficeParams {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeOfficeParams());
  });

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

      final expectation = expectLater(
        bloc.stream,
        emitsInOrder(expectedStates),
      );

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

      final expectation = expectLater(
        bloc.stream,
        emitsInOrder(expectedStates),
      );

      bloc.add(const OfficesEvent.getOffices());
      await expectation;
    });
  });

  group('AddOfficeEvent with OfficeParams', () {
    const tParams = OfficeParams(
      name: 'Main HQ',
      lat: 30.0444,
      lng: 31.2357,
      radius: 100,
    );
    const tResponse = OfficesEntity(status: 201, message: 'created', data: []);

    test(
      'emits [loading, modified] when addOffice with params succeeds',
      () async {
        when(
          () => mockAddOfficeUC.call(any()),
        ).thenAnswer((_) async => const Right(tResponse));

        final expectedStates = [
          const OfficesState.loading(),
          const OfficesState.modified(),
        ];

        final expectation = expectLater(
          bloc.stream,
          emitsInOrder(expectedStates),
        );

        bloc.add(const OfficesEvent.addOffice(params: tParams));
        await expectation;

        verify(() => mockAddOfficeUC.call(tParams)).called(1);
      },
    );

    test('emits [loading, error] when addOffice fails', () async {
      when(() => mockAddOfficeUC.call(any())).thenAnswer(
        (_) async => const Left(AppFailure.server(message: 'Creation failed')),
      );

      final expectedStates = [
        const OfficesState.loading(),
        const OfficesState.error(message: 'Creation failed'),
      ];

      final expectation = expectLater(
        bloc.stream,
        emitsInOrder(expectedStates),
      );

      bloc.add(const OfficesEvent.addOffice(params: tParams));
      await expectation;
    });
  });

  group('EditOfficeEvent with OfficeParams', () {
    const tParams = OfficeParams(
      id: 5,
      name: 'Branch 2',
      lat: 30.0444,
      lng: 31.2357,
      radius: 150,
    );
    const tResponse = OfficesEntity(status: 200, message: 'updated', data: []);

    test(
      'emits [loading, modified] when editOffice with params succeeds',
      () async {
        when(
          () => mockEditOfficeUC.call(any()),
        ).thenAnswer((_) async => const Right(tResponse));

        final expectedStates = [
          const OfficesState.loading(),
          const OfficesState.modified(),
        ];

        final expectation = expectLater(
          bloc.stream,
          emitsInOrder(expectedStates),
        );

        bloc.add(const OfficesEvent.editOffice(id: 5, params: tParams));
        await expectation;

        verify(() => mockEditOfficeUC.call(tParams)).called(1);
      },
    );
  });
}
