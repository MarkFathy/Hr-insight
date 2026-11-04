import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leave_params.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/employee_leaves/domain/usecases/get_leaves.dart';
import 'package:hr_app/features/employee_leaves/domain/usecases/request_leave.dart';
import 'package:hr_app/features/employee_leaves/presentation/bloc/leaves_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetLeavesUC extends Mock implements GetLeavesUC {}

class MockRequestLeaveUC extends Mock implements RequestLeaveUC {}

class FakeLeaveParams extends Fake implements LeaveParams {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeLeaveParams());
  });

  late LeavesBloc bloc;
  late MockGetLeavesUC mockGetLeavesUC;
  late MockRequestLeaveUC mockRequestLeaveUC;

  setUp(() {
    mockGetLeavesUC = MockGetLeavesUC();
    mockRequestLeaveUC = MockRequestLeaveUC();

    bloc = LeavesBloc(
      getLeavesUC: mockGetLeavesUC,
      requestLeaveUC: mockRequestLeaveUC,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is LeavesState.initial()', () {
    expect(bloc.state, const LeavesState.initial());
  });

  group('GetLeavesEvent', () {
    const tLeaves = LeavesEntity(status: 200, message: 'ok', data: []);

    test('emits [loading, loaded] when getLeaves succeeds', () async {
      when(
        () => mockGetLeavesUC.call(),
      ).thenAnswer((_) async => const Right(tLeaves));

      final expected = [
        const LeavesState.loading(),
        const LeavesState.loaded(leaves: tLeaves),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const LeavesEvent.getLeaves());
      await expectation;
    });

    test('emits [loading, error] when getLeaves fails', () async {
      when(() => mockGetLeavesUC.call()).thenAnswer(
        (_) async => const Left(AppFailure.server(message: 'Server error')),
      );

      final expected = [
        const LeavesState.loading(),
        const LeavesState.error(message: 'Server error'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const LeavesEvent.getLeaves());
      await expectation;
    });
  });

  group('RequestLeaveEvent with LeaveParams', () {
    final tParams = LeaveParams(
      notes: 'Sick leave',
      from: DateTime(2026, 3, 20),
      to: DateTime(2026, 3, 22),
      leaveType: 'medical',
    );

    test('emits [loading, sent] when request succeeds', () async {
      when(
        () => mockRequestLeaveUC.call(any()),
      ).thenAnswer((_) async => const Right(unit));

      final expected = [const LeavesState.loading(), const LeavesState.sent()];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(LeavesEvent.requestLeave(params: tParams));
      await expectation;

      verify(() => mockRequestLeaveUC.call(tParams)).called(1);
    });

    test('emits [loading, error] when request fails', () async {
      when(() => mockRequestLeaveUC.call(any())).thenAnswer(
        (_) async => const Left(AppFailure.server(message: 'Request failed')),
      );

      final expected = [
        const LeavesState.loading(),
        const LeavesState.error(message: 'Request failed'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(LeavesEvent.requestLeave(params: tParams));
      await expectation;
    });
  });
}
