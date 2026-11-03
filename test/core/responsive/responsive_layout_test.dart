import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app/core/theme/core_theme.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/widgets/app_button.dart';
import 'package:hr_app/core/widgets/app_empty_state.dart';
import 'package:hr_app/core/widgets/app_error_state.dart';
import 'package:hr_app/core/widgets/app_section_header.dart';
import 'package:hr_app/core/widgets/app_text_field.dart';
import 'package:hr_app/localization/app_localizations.dart';

void main() {
  group('AppBreakpoints Unit Tests', () {
    test('gridColumnsForWidth returns correct columns per breakpoint tier', () {
      expect(AppBreakpoints.gridColumnsForWidth(320), equals(1));
      expect(AppBreakpoints.gridColumnsForWidth(359), equals(1));
      expect(AppBreakpoints.gridColumnsForWidth(360), equals(2));
      expect(AppBreakpoints.gridColumnsForWidth(430), equals(2));
      expect(AppBreakpoints.gridColumnsForWidth(599), equals(2));
      expect(AppBreakpoints.gridColumnsForWidth(600), equals(3));
      expect(AppBreakpoints.gridColumnsForWidth(768), equals(3));
      expect(AppBreakpoints.gridColumnsForWidth(839), equals(3));
      expect(AppBreakpoints.gridColumnsForWidth(840), equals(4));
      expect(AppBreakpoints.gridColumnsForWidth(1024), equals(4));
      expect(AppBreakpoints.gridColumnsForWidth(1280), equals(4));
    });

    test('gridColumnsForWidth respects custom column overrides', () {
      final columns = AppBreakpoints.gridColumnsForWidth(
        700,
        compactColumns: 2,
        tabletColumns: 4,
        expandedColumns: 5,
      );
      expect(columns, equals(4));
    });
  });

  group('Multi-Viewport Responsive Widget Tests', () {
    final viewports = <String, Size>{
      'compact_phone_320x568': const Size(320, 568),
      'standard_phone_360x800': const Size(360, 800),
      'modern_phone_390x844': const Size(390, 844),
      'large_phone_430x932': const Size(430, 932),
      'small_tablet_600x960': const Size(600, 960),
      'medium_tablet_768x1024': const Size(768, 1024),
      'large_tablet_landscape_1024x768': const Size(1024, 768),
      'desktop_1280x800': const Size(1280, 800),
    };

    Widget createTestApp({
      required Widget child,
      TextDirection textDirection = TextDirection.rtl,
      double textScaleFactor = 1.0,
    }) => MaterialApp(
      theme: themeData,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar'), Locale('en')],
      locale: textDirection == TextDirection.rtl
          ? const Locale('ar')
          : const Locale('en'),
      home: Directionality(
        textDirection: textDirection,
        child: MediaQuery(
          data: MediaQueryData(
            textScaler: TextScaler.linear(textScaleFactor),
          ),
          child: Scaffold(body: SafeArea(child: child)),
        ),
      ),
    );

    for (final entry in viewports.entries) {
      testWidgets('ResponsiveContainer bounds on ${entry.key}', (tester) async {
        tester.view.physicalSize = entry.value;
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          createTestApp(
            child: ResponsiveContainer(
              child: Container(
                key: const Key('inner_box'),
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final innerBox = tester.getRect(find.byKey(const Key('inner_box')));
        final expectedWidth = entry.value.width > 640 ? 640.0 : entry.value.width;
        expect(innerBox.width, closeTo(expectedWidth, 0.1));
      });

      testWidgets('Core components render without overflow on ${entry.key}', (
        tester,
      ) async {
        tester.view.physicalSize = entry.value;
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final ctrl = TextEditingController();
        addTearDown(ctrl.dispose);

        await tester.pumpWidget(
          createTestApp(
            child: SingleChildScrollView(
              child: ResponsiveContainer(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppSectionHeader(
                        title: 'العنوان التجريبي للمعاينة المتجاوبة',
                        actionTitle: 'عرض الكل',
                        onAction: () {},
                      ),
                      16.ph,
                      AppTextField(
                        label: 'اسم المستخدم أو البريد',
                        controller: ctrl,
                        prefixIcon: const Icon(Icons.person),
                      ),
                      12.ph,
                      AppButton(
                        title: 'تسجيل الدخول',
                        icon: Icons.login_rounded,
                        onTap: () {},
                      ),
                      16.ph,
                      const AppEmptyState(
                        title: 'لا توجد بيانات حالية',
                        subtitle: 'يمكنك إضافة عناصر جديدة للبدء',
                      ),
                      16.ph,
                      AppErrorState(
                        message: 'حدث خطأ في الاتصال بالسيرفر',
                        onRetry: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
        expect(find.text('تسجيل الدخول'), findsOneWidget);
        expect(find.text('لا توجد بيانات حالية'), findsOneWidget);
      });
    }

    testWidgets('Accessibility text scale factors (1.3x and 2.0x) do not cause overflow', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      for (final scale in [1.3, 2.0]) {
        await tester.pumpWidget(
          createTestApp(
            textScaleFactor: scale,
            child: SingleChildScrollView(
              child: ResponsiveContainer(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const AppSectionHeader(
                        title: 'قسم مخصص للاختبار مع تكبير الخط',
                      ),
                      16.ph,
                      AppButton(
                        title: 'تأكيد العملية مع نص أطول للاختبار',
                        onTap: () {},
                      ),
                      16.ph,
                      const AppEmptyState(
                        title: 'نص عريض لتجربة إمكانية الوصول',
                        subtitle: 'تفاصيل تجربة إمكانية الوصول مع تكبير الخط وتجنب الفيضان',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          tester.takeException(),
          isNull,
          reason: 'Failed at textScaleFactor: $scale',
        );
      }
    });

    testWidgets('RTL and LTR directionality render correctly', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      // RTL
      await tester.pumpWidget(
        createTestApp(
          child: AppSectionHeader(
            title: 'عنوان باللغة العربية',
            actionTitle: 'المزيد',
            onAction: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);

      // LTR
      await tester.pumpWidget(
        createTestApp(
          textDirection: TextDirection.ltr,
          child: AppSectionHeader(
            title: 'English Section Title',
            actionTitle: 'View All',
            onAction: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  });
}
