// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'hr_app';

  @override
  String get internet_restored_banner => 'Internet connection restored';

  @override
  String get internet_unstable_banner =>
      'Unstable internet connection — loading may be slow';

  @override
  String get internet_captive_portal_banner =>
      'Network needs sign-in or has no data balance — tap to check';

  @override
  String get internet_no_access_banner =>
      'Connected to the network but no internet — check your data balance';

  @override
  String get internet_disconnected_banner =>
      'No Internet Connection — Try Again';

  @override
  String get no_internet_title => 'No Internet Connection';

  @override
  String get try_again_text => 'Try Again';
}
