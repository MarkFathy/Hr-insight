import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hr_app/src/features/settings/settings_controller.dart';
import 'package:hr_app/src/features/settings/settings_service.dart';
import 'src/app.dart';
import 'package:hr_app/src/injector.dart' as inj;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  inj.init();
  runApp(Phoenix(
      child:
      MyApp(settingsController: settingsController)));
          
}
