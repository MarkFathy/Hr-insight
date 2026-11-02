import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/errors/app_failure.dart';
import 'package:hr_app/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/employee/leaves/domain/use_cases/get_leaves.dart';
import 'package:hr_app/features/employee/leaves/domain/use_cases/request_leave.dart';
import 'package:hr_app/features/employee/leaves/presentation/bloc/bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetLeavesUC extends Mock implements GetLeavesUC {}

class MockRequestLeaveUC extends Mock implements RequestLeaveUC {}

void main() {
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
}
