import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/features/profile/data/models/employee_profile_model.dart';
import 'package:hr_app/features/profile/domain/entities/update_profile_params.dart';
import 'package:hr_app/features/profile/domain/usecases/get_profile.dart';
import 'package:hr_app/features/profile/domain/usecases/update_profile.dart';
import 'package:hr_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetProfileUC extends Mock implements GetProfileUC {}

class MockUpdateProfileUC extends Mock implements UpdateProfileUC {}

void main() {
  late ProfileBloc bloc;
  late MockGetProfileUC mockGetProfileUC;
  late MockUpdateProfileUC mockUpdateProfileUC;

  setUp(() {
    mockGetProfileUC = MockGetProfileUC();
    mockUpdateProfileUC = MockUpdateProfileUC();

    bloc = ProfileBloc(
      getProfileUC: mockGetProfileUC,
      updateProfileUC: mockUpdateProfileUC,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is ProfileState.initial()', () {
    expect(bloc.state, const ProfileState.initial());
  });

  group('GetProfileEvent', () {
    final tEmployeeJson = jsonEncode({
      'status': 200,
      'message': 'ok',
      'data': {'id': 1, 'name': 'John Doe', 'email': 'john@test.com'},
    });

    final tManagerJson = jsonEncode({
      'status': 200,
      'message': 'ok',
      'data': {
        'id': 1,
        'company': 'Acme Inc',
        'email': 'manager@test.com',
        'phone': '123456',
        'pin': '7777',
      },
    });

    test(
      'emits [loading, loaded] when getProfile succeeds for employee',
      () async {
        when(
          () => mockGetProfileUC.call(isEmployee: true),
        ).thenAnswer((_) async => Right(tEmployeeJson));

        final expected = [
          const ProfileState.loading(),
          ProfileState.loaded(
            employeeProfile: EmployeeProfileModel.fromRawJson(tEmployeeJson),
          ),
        ];

        final expectation = expectLater(bloc.stream, emitsInOrder(expected));

        bloc.add(const ProfileEvent.getProfile(isEmployee: true));
        await expectation;
      },
    );

    test(
      'emits [loading, loaded] when getProfile succeeds for manager',
      () async {
        when(
          () => mockGetProfileUC.call(isEmployee: false),
        ).thenAnswer((_) async => Right(tManagerJson));

        final expectation = expectLater(
          bloc.stream,
          emitsInOrder([
            const ProfileState.loading(),
            predicate<ProfileState>(
              (state) =>
                  state is ProfileLoadedState &&
                  state.managerProfile?.data?.company == 'Acme Inc',
            ),
          ]),
        );

        bloc.add(const ProfileEvent.getProfile(isEmployee: false));
        await expectation;
      },
    );

    test('emits [loading, error] when getProfile fails', () async {
      when(
        () => mockGetProfileUC.call(isEmployee: any(named: 'isEmployee')),
      ).thenAnswer(
        (_) async =>
            const Left(AppFailure.server(message: 'Failed to fetch profile')),
      );

      final expected = [
        const ProfileState.loading(),
        const ProfileState.error(message: 'Failed to fetch profile'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const ProfileEvent.getProfile(isEmployee: true));
      await expectation;
    });
  });

  group('UpdateProfileEvent', () {
    const tParams = UpdateProfileParams(id: 1, status: true);
    const tProfile = EmployeeProfileModel(status: 200, message: 'Updated');

    test('emits [loading, loaded] when updateProfile succeeds', () async {
      when(
        () => mockUpdateProfileUC.call(tParams),
      ).thenAnswer((_) async => const Right(tProfile));

      final expected = [
        const ProfileState.loading(),
        const ProfileState.loaded(employeeProfile: EmployeeProfileModel()),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const ProfileEvent.updateProfile(tParams));
      await expectation;
    });

    test('emits [loading, error] when updateProfile fails', () async {
      when(() => mockUpdateProfileUC.call(tParams)).thenAnswer(
        (_) async =>
            const Left(AppFailure.server(message: 'Failed to update profile')),
      );

      final expected = [
        const ProfileState.loading(),
        const ProfileState.error(message: 'Failed to update profile'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const ProfileEvent.updateProfile(tParams));
      await expectation;
    });
  });
}
