import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/sign_entity.dart';
import 'package:hr_app/features/employee_attendance/domain/usecases/get_attendance.dart';
import 'package:hr_app/features/employee_attendance/domain/usecases/sign_attendance.dart';
import 'package:hr_app/features/employee_attendance/presentation/bloc/attendance_bloc.dart';
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
    const tAttendance = AttendanceEntity(status: 200, message: 'ok', data: []);

    test('emits [loading, signed, loaded] when sign succeeds', () async {
      when(
        () => mockSignUC.call(
          isAttend: any(named: 'isAttend'),
          attendanceId: any(named: 'attendanceId'),
          date: any(named: 'date'),
        ),
      ).thenAnswer((_) async => const Right(tSignEntity));

      when(
        () => mockGetAttendanceUC.call(),
      ).thenAnswer((_) async => const Right(tAttendance));

      final expected = [
        const AttendanceState.loading(),
        const AttendanceState.signed(message: 'Signed successfully'),
        const AttendanceState.loaded(attendance: tAttendance),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const AttendanceEvent.sign(isAttend: true));
      await expectation;
    });

    test(
      'passes attendanceId and date on departure sign and refreshes attendance',
      () async {
        when(
          () => mockSignUC.call(
            isAttend: false,
            attendanceId: 15,
            date: '2026-11-03',
          ),
        ).thenAnswer((_) async => const Right(tSignEntity));

        when(
          () => mockGetAttendanceUC.call(),
        ).thenAnswer((_) async => const Right(tAttendance));

        final expected = [
          const AttendanceState.loading(),
          const AttendanceState.signed(message: 'Signed successfully'),
          const AttendanceState.loaded(attendance: tAttendance),
        ];

        final expectation = expectLater(bloc.stream, emitsInOrder(expected));

        bloc.add(
          const AttendanceEvent.sign(
            isAttend: false,
            attendanceId: 15,
            date: '2026-11-03',
          ),
        );
        await expectation;
      },
    );

    test('emits [loading, error] when sign fails', () async {
      when(
        () => mockSignUC.call(
          isAttend: any(named: 'isAttend'),
          attendanceId: any(named: 'attendanceId'),
          date: any(named: 'date'),
        ),
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
