import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/errors/app_failure.dart';
import 'package:hr_app/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/manager/leaves/domain/use_cases/get_leaves.dart';
import 'package:hr_app/features/manager/leaves/domain/use_cases/set_leave.dart';
import 'package:hr_app/features/manager/leaves/presentation/bloc/bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetManagerLeavesUC extends Mock implements GetManagerLeavesUC {}

class MockSetLeaveUC extends Mock implements SetLeaveUC {}

void main() {
  late ManagerLeavesBloc bloc;
  late MockGetManagerLeavesUC mockGetLeavesUC;
  late MockSetLeaveUC mockSetLeaveUC;

  setUp(() {
    mockGetLeavesUC = MockGetManagerLeavesUC();
    mockSetLeaveUC = MockSetLeaveUC();

    bloc = ManagerLeavesBloc(
      getLeavesUC: mockGetLeavesUC,
      setLeaveStateUC: mockSetLeaveUC,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is ManagerLeavesState.initial()', () {
    expect(bloc.state, const ManagerLeavesState.initial());
  });

  group('GetManagerLeavesEvent', () {
    const tLeaves = LeavesEntity(status: 200, message: 'ok', data: []);

    test('emits [loading, loaded] when getLeaves succeeds', () async {
      when(
        () => mockGetLeavesUC.call(),
      ).thenAnswer((_) async => const Right(tLeaves));

      final expected = [
        const ManagerLeavesState.loading(),
        const ManagerLeavesState.loaded(leaves: tLeaves),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const ManagerLeavesEvent.getLeaves());
      await expectation;
    });

    test('emits [loading, error] when getLeaves fails', () async {
      when(() => mockGetLeavesUC.call()).thenAnswer(
        (_) async => const Left(AppFailure.server(message: 'Server error')),
      );

      final expected = [
        const ManagerLeavesState.loading(),
        const ManagerLeavesState.error(message: 'Server error'),
      ];

      final expectation = expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const ManagerLeavesEvent.getLeaves());
      await expectation;
    });
  });
}
