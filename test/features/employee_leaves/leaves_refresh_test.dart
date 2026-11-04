import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/app/di/service_locator.dart';
import 'package:hr_app/core/theme/core_theme.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/employee_leaves/domain/usecases/get_leaves.dart';
import 'package:hr_app/features/employee_leaves/domain/usecases/request_leave.dart';
import 'package:hr_app/features/employee_leaves/presentation/bloc/leaves_bloc.dart';
import 'package:hr_app/features/employee_leaves/presentation/pages/leaves_page.dart';
import 'package:mocktail/mocktail.dart';

class MockGetLeavesUC extends Mock implements GetLeavesUC {}

class MockRequestLeaveUC extends Mock implements RequestLeaveUC {}

void main() {
  late MockGetLeavesUC mockGetLeavesUC;
  late MockRequestLeaveUC mockRequestLeaveUC;

  setUp(() async {
    mockGetLeavesUC = MockGetLeavesUC();
    mockRequestLeaveUC = MockRequestLeaveUC();

    if (sl.isRegistered<LeavesBloc>()) {
      await sl.unregister<LeavesBloc>();
    }
    sl.registerFactory<LeavesBloc>(
      () => LeavesBloc(
        getLeavesUC: mockGetLeavesUC,
        requestLeaveUC: mockRequestLeaveUC,
      ),
    );
  });

  tearDown(() async {
    if (sl.isRegistered<LeavesBloc>()) {
      await sl.unregister<LeavesBloc>();
    }
  });

  testWidgets('LeavesScreen renders RefreshIndicator', (tester) async {
    when(() => mockGetLeavesUC.call()).thenAnswer(
      (_) async =>
          const Right(LeavesEntity(status: 200, message: 'ok', data: [])),
    );

    await tester.pumpWidget(
      MaterialApp(theme: themeData, home: const LeavesScreen()),
    );

    await tester.pump();
    expect(find.byType(RefreshIndicator), findsOneWidget);
  });
}
