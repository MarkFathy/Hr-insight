import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/di/service_locator.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/home/navigation_screen.dart';
import 'package:hr_app/src/features/intro/intro_screen.dart';
import 'package:upgrader/upgrader.dart';

class RoutingScreen extends StatelessWidget {
  static const routeName = '/routing';
  const RoutingScreen({super.key});

  @override
  Widget build(BuildContext context) => UpgradeAlert(
      showIgnore: false,
      showReleaseNotes: false,
      upgrader: Upgrader(
        durationUntilAlertAgain: Duration.zero,
        languageCode: 'ar',
      ),
      child: BlocProvider(
        create: (context) => sl<AuthBloc>()..add(const AutoLoginEvent()),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) => (state is AuthLoadingState)
                ? const Center(child: CircularProgressIndicator())
                : state is AuthSuccessState
                ? NavigationScreen(isEmployee: state.isEmployee)
                : const IntroScreen(),
        ),
      ),
    );
}
