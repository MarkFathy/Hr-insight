import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_app/src/core/di/service_locator.dart';
import 'package:hr_app/src/core/theme/core_theme.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/src/features/employee/leaves/domain/use_cases/get_leaves.dart';
import 'package:hr_app/src/features/employee/leaves/domain/use_cases/request_leave.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/leaves_screen.dart';
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
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          theme: themeData,
          home: const LeavesScreen(),
        ),
      ),
    );

    await tester.pump();
    expect(find.byType(RefreshIndicator), findsOneWidget);
  });
}
