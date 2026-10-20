import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/src/core/errors/app_failure.dart';
import 'package:hr_app/src/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/src/features/employee/attendance/domain/entities/sign_entity.dart';
import 'package:hr_app/src/features/employee/attendance/domain/use_cases/get_attendance.dart';
import 'package:hr_app/src/features/employee/attendance/domain/use_cases/sign_attendance_use_case.dart';
import 'package:hr_app/src/features/employee/attendance/presentation/bloc/bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAttendanceUC extends Mock implements GetAttendanceUC {}

class MockSignUC extends Mock implements SignUC {}

void main() {
  late AttendanceBloc bloc;
  late MockGetAttendanceUC mockGetAttendanceUC;
  late MockSignUC mockSignUC;

  setUp(() {
    mockGetAttendanceUC = MockGetAttendanceUC();
    mockSignUC = MockSignUC();

    bloc = AttendanceBloc(
      getAttendanceUC: mockGetAttendanceUC,
      signUC: mockSignUC,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is AttendanceState.initial()', () {
    expect(bloc.state, const AttendanceState.initial());
  });

  group('GetAttendanceEvent', () {
    const tAttendance = AttendanceEntity(status: 200, message: 'ok', data: []);

    test('emits [loading, loaded] when getAttendance succeeds', () async {
      when(
        () => mockGetAttendanceUC.call(),
      ).thenAnswer((_) async => const Right(tAttendance));

      final expected = [
        const AttendanceState.loading(),
        const AttendanceState.loaded(attendance: tAttendance),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const AttendanceEvent.getAttendance());
      await expectation;
    });

    test('emits [loading, error] when getAttendance fails', () async {
      when(() => mockGetAttendanceUC.call()).thenAnswer(
        (_) async => const Left(AppFailure.server(message: 'Server error')),
      );

      final expected = [
        const AttendanceState.loading(),
        const AttendanceState.error(message: 'Server error'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const AttendanceEvent.getAttendance());
      await expectation;
    });
  });

  group('SignEvent', () {
    const tSignEntity = SignEntity(status: 200, message: 'Signed successfully');

    test('emits [loading, signed] when sign succeeds', () async {
      when(
        () => mockSignUC.call(isAttend: any(named: 'isAttend')),
      ).thenAnswer((_) async => const Right(tSignEntity));

      final expected = [
        const AttendanceState.loading(),
        const AttendanceState.signed(message: 'Signed successfully'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const AttendanceEvent.sign(isAttend: true));
      await expectation;
    });

    test('emits [loading, error] when sign fails', () async {
      when(
        () => mockSignUC.call(isAttend: any(named: 'isAttend')),
      ).thenAnswer(
        (_) async => const Left(AppFailure.server(message: 'Failed to sign')),
      );

      final expected = [
        const AttendanceState.loading(),
        const AttendanceState.error(message: 'Failed to sign'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const AttendanceEvent.sign(isAttend: true));
      await expectation;
    });
  });
}
