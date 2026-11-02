// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'الحقيقة';

  @override
  String get internet_restored_banner => 'تم استعادة الاتصال بالإنترنت';

  @override
  String get internet_unstable_banner =>
      'اتصال الإنترنت ضعيف — قد يتأخر التحميل';

  @override
  String get internet_captive_portal_banner =>
      'الشبكة محتاجة تسجيل دخول أو الباقة منتهية — اضغط للفحص';

  @override
  String get internet_no_access_banner =>
      'متصل بالشبكة لكن بدون إنترنت — تأكد من رصيد الباقة';

  @override
  String get internet_disconnected_banner =>
      'لا يوجد اتصال بالإنترنت — حاول مرة أخرى';

  @override
  String get no_internet_title => 'لا يوجد اتصال بالإنترنت';

  @override
  String get try_again_text => 'حاول مرة أخرى';
}
