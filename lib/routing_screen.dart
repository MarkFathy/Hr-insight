import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/features/home/navigation_screen.dart';
import 'package:hr_app/features/intro/intro_screen.dart';
import 'package:upgrader/upgrader.dart';

class RoutingScreen extends StatefulWidget {
  static const routeName = '/routing';
  const RoutingScreen({super.key});

  @override
  State<RoutingScreen> createState() => _RoutingScreenState();
}

class _RoutingScreenState extends State<RoutingScreen>
    with AutoConnectivityRestoreMixin {
  late final AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<AuthBloc>()..add(const AutoLoginEvent());
  }

  @override
  void onConnectivityRestored() {
    if (_bloc.state is! AuthSuccessState) {
      _bloc.add(const AutoLoginEvent());
    }
  }

  @override
  void dispose() {
    unawaited(_bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => UpgradeAlert(
    showIgnore: false,
    showReleaseNotes: false,
    upgrader: Upgrader(
      durationUntilAlertAgain: Duration.zero,
      languageCode: 'ar',
    ),
    child: BlocProvider.value(
      value: _bloc,
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
