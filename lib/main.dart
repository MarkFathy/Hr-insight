import 'package:flutter/material.dart';
import 'package:hr_app/src/app.dart';
import 'package:hr_app/src/core/di/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}
