import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/errors/app_failure.dart';
import 'package:hr_app/core/usecases/usecase.dart';
import 'package:hr_app/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_info_entity.dart';
import 'package:hr_app/features/authentication/domain/use_cases/auto_login_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/change_password_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/delete_account_use_case.dart';
import 'package:hr_app/features/authentication/domain/use_cases/employee_sign_in_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/employee_sign_up_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/forget_password.dart';
import 'package:hr_app/features/authentication/domain/use_cases/get_departments_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/manager_sign_in_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/manager_sign_up_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/reset_password.dart';
import 'package:hr_app/features/authentication/domain/use_cases/sign_out_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/verify_email.dart';
import 'package:hr_app/features/authentication/presentation/bloc/bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockAutoLoginUC extends Mock implements AutoLoginUC {}

class MockEmployeeSignInUC extends Mock implements EmployeeSignInUC {}

class MockEmployeeSignUpUC extends Mock implements EmployeeSignUpUC {}

class MockManagerSignInUC extends Mock implements ManagerSignInUC {}

class MockManagerSignUpUC extends Mock implements ManagerSignUpUC {}

class MockGetManagerDepartmentsUC extends Mock
    implements GetManagerDepartmentsUC {}

class MockChangePasswordUC extends Mock implements ChangePasswordUC {}

class MockVerifyEmailUC extends Mock implements VerifyEmailUC {}

class MockSignOutUC extends Mock implements SignOutUC {}

class MockForgetPasswordUC extends Mock implements ForgetPasswordUC {}

class MockResetPasswordUC extends Mock implements ResetPasswordUC {}

class MockDeleteAccountUC extends Mock implements DeleteAccountUC {}

void main() {
  late AuthBloc bloc;
  late MockAutoLoginUC mockAutoLoginUC;
  late MockEmployeeSignInUC mockEmployeeSignInUC;
  late MockEmployeeSignUpUC mockEmployeeSignUpUC;
  late MockManagerSignInUC mockManagerSignInUC;
  late MockManagerSignUpUC mockManagerSignUpUC;
  late MockGetManagerDepartmentsUC mockGetDepartmentsUC;
  late MockChangePasswordUC mockChangePasswordUC;
  late MockVerifyEmailUC mockVerifyEmailUC;
  late MockSignOutUC mockSignOutUC;
  late MockForgetPasswordUC mockForgetPasswordUC;
  late MockResetPasswordUC mockResetPasswordUC;
  late MockDeleteAccountUC mockDeleteAccountUC;

  setUpAll(() {
    registerFallbackValue(const NoParams());
    registerFallbackValue(const AccountDeleteParams(password: 'dummy'));
  });

  setUp(() {
    mockAutoLoginUC = MockAutoLoginUC();
    mockEmployeeSignInUC = MockEmployeeSignInUC();
    mockEmployeeSignUpUC = MockEmployeeSignUpUC();
    mockManagerSignInUC = MockManagerSignInUC();
    mockManagerSignUpUC = MockManagerSignUpUC();
    mockGetDepartmentsUC = MockGetManagerDepartmentsUC();
    mockChangePasswordUC = MockChangePasswordUC();
    mockVerifyEmailUC = MockVerifyEmailUC();
    mockSignOutUC = MockSignOutUC();
    mockForgetPasswordUC = MockForgetPasswordUC();
    mockResetPasswordUC = MockResetPasswordUC();
    mockDeleteAccountUC = MockDeleteAccountUC();

    bloc = AuthBloc(
      autoLoginUC: mockAutoLoginUC,
      signInUC: mockEmployeeSignInUC,
      signOutUC: mockSignOutUC,
      employeeSignUpUC: mockEmployeeSignUpUC,
      managerSignUpUC: mockManagerSignUpUC,
      getDepartmentsUC: mockGetDepartmentsUC,
      changePasswordUC: mockChangePasswordUC,
      managerSignInUC: mockManagerSignInUC,
      verifyEmailUC: mockVerifyEmailUC,
      forgetPasswordUC: mockForgetPasswordUC,
      resetPasswordUC: mockResetPasswordUC,
      deleteAccountUC: mockDeleteAccountUC,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is AuthState.initial()', () {
    expect(bloc.state, const AuthState.initial());
  });

  group('AutoLoginEvent', () {
    test(
      'emits [loading, success] when autoLogin succeeds for employee',
      () async {
        when(() => mockAutoLoginUC.call(any())).thenAnswer(
          (_) async => const Right({
            'isEmployee': true,
            'data': {
              'token': 'mock-token',
              'data': {
                'id': 1,
                'name': 'Employee One',
                'email': 'emp@test.com',
              },
            },
          }),
        );

        final expectation = expectLater(
          bloc.stream,
          emitsInOrder([
            const AuthState.loading(),
            predicate<AuthState>(
              (state) => state is AuthSuccessState && state.isEmployee,
            ),
          ]),
        );

        bloc.add(const AuthEvent.autoLogin());
        await expectation;
      },
    );

    test('emits [loading, initial] when autoLogin fails', () async {
      when(() => mockAutoLoginUC.call(any())).thenAnswer(
        (_) async =>
            const Left(AppFailure.emptyCache(message: 'Not logged in')),
      );

      final expected = [const AuthState.loading(), const AuthState.initial()];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const AuthEvent.autoLogin());
      await expectation;
    });
  });

  group('EmployeeSignInEvent', () {
    const tEmployee = EmployeeEntity(
      status: 200,
      message: 'ok',
      data: UserDataEntity(
        token: 'token',
        employee: EmployeeDataEntity(id: 1, name: 'Emp', email: 'emp@test.com'),
      ),
    );

    test('emits [loading, success] when employeeSignIn succeeds', () async {
      bloc.emailCtrl.text = 'emp@test.com';
      bloc.passwordCtrl.text = 'password123';

      when(
        () => mockEmployeeSignInUC.call(any()),
      ).thenAnswer((_) async => const Right(tEmployee));

      final expected = [
        const AuthState.loading(),
        const AuthState.success(employee: tEmployee),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const AuthEvent.employeeSignIn());
      await expectation;
    });

    test('emits [loading, failure] when employeeSignIn fails', () async {
      bloc.emailCtrl.text = 'emp@test.com';
      bloc.passwordCtrl.text = 'wrongpass';

      when(() => mockEmployeeSignInUC.call(any())).thenAnswer(
        (_) async =>
            const Left(AppFailure.server(message: 'Invalid credentials')),
      );

      final expected = [
        const AuthState.loading(),
        const AuthState.failure('Invalid credentials'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const AuthEvent.employeeSignIn());
      await expectation;
    });
  });

  group('SignOutEvent', () {
    test('emits [loading, initial] when signOut succeeds', () async {
      when(
        () => mockSignOutUC.call(any()),
      ).thenAnswer((_) async => const Right('Signed out'));

      final expected = [const AuthState.loading(), const AuthState.initial()];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const AuthEvent.signOut());
      await expectation;
    });
  });

  group('GetDepartmentsEvent', () {
    const tInfo = ManagerInfoEntity(
      status: 200,
      message: 'ok',
      data: ManageInfoDataEntity(
        manager: ManagerDataEntity(id: 1, name: 'Mgr'),
      ),
    );

    test('emits [loading, validUID] when getDepartments succeeds', () async {
      bloc.managerPin.text = '1234';

      when(
        () => mockGetDepartmentsUC.call('1234'),
      ).thenAnswer((_) async => const Right(tInfo));

      final expected = [const AuthState.loading(), const AuthState.validUID()];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const AuthEvent.getDepartments());
      await expectation;
    });
  });

  group('DeleteAccountEvent', () {
    const params = AccountDeleteParams(password: '123456');

    test(
      'emits [loading, accountDeleted] when deleteAccount succeeds',
      () async {
        when(
          () => mockDeleteAccountUC.call(any()),
        ).thenAnswer((_) async => const Right(null));

        final expected = [
          const AuthState.loading(),
          const AuthState.accountDeleted('تم حذف الحساب بنجاح'),
        ];

        final expectation = expectLater(bloc.stream, emitsInOrder(expected));

        bloc.add(const AuthEvent.deleteAccount(params));
        await expectation;
      },
    );

    test('emits [loading, failure] when deleteAccount fails', () async {
      when(() => mockDeleteAccountUC.call(any())).thenAnswer(
        (_) async => const Left(AppFailure.server(message: 'Unauthenticated.')),
      );

      final expected = [
        const AuthState.loading(),
        const AuthState.failure('Unauthenticated.'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const AuthEvent.deleteAccount(params));
      await expectation;
    });
  });
}
