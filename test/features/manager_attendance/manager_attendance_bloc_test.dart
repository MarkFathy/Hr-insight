import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/features/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/features/manager_attendance/domain/entities/manager_attendance_entity.dart';
import 'package:hr_app/features/manager_attendance/domain/usecases/get_manager_attendance.dart';
import 'package:hr_app/features/manager_attendance/presentation/bloc/manager_attendance_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetManagerAttendanceUC extends Mock
    implements GetManagerAttendanceUC {}

void main() {
  late ManagerAttendanceBloc bloc;
  late MockGetManagerAttendanceUC mockGetManagerAttendanceUC;

  setUp(() {
    mockGetManagerAttendanceUC = MockGetManagerAttendanceUC();
    bloc = ManagerAttendanceBloc(
      getManagerAttendanceUC: mockGetManagerAttendanceUC,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is ManagerAttendanceState.initial()', () {
    expect(bloc.state, const ManagerAttendanceState.initial());
  });

  group('LoadManagerAttendanceEvent', () {
    final tParams = ManagerAttendanceParams(
      employeeId: '1',
      date: DateTime(2026),
    );
    const tAttendance = ManagerAttendanceEntity(
      status: 200,
      message: 'ok',
      data: [],
    );

    test('emits [loading, loaded] when getAttendance succeeds', () async {
      when(
        () => mockGetManagerAttendanceUC.call(tParams),
      ).thenAnswer((_) async => const Right(tAttendance));

      final expected = [
        const ManagerAttendanceState.loading(),
        const ManagerAttendanceState.loaded(attendance: tAttendance),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(ManagerAttendanceEvent.load(tParams));
      await expectation;
    });

    test('emits [loading, error] when getAttendance fails', () async {
      when(() => mockGetManagerAttendanceUC.call(tParams)).thenAnswer(
        (_) async => const Left(AppFailure.server(message: 'Server error')),
      );

      final expected = [
        const ManagerAttendanceState.loading(),
        const ManagerAttendanceState.error('Server error'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(ManagerAttendanceEvent.load(tParams));
      await expectation;
    });
  });
}
