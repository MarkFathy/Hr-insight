import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/app/di/service_locator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:hr_app/features/home/presentation/pages/navigation_page.dart';
import 'package:hr_app/features/intro/presentation/pages/intro_page.dart';
import 'package:upgrader/upgrader.dart';

class RoutingPage extends StatefulWidget {
  static const routeName = '/routing';
  const RoutingPage({super.key});

  @override
  State<RoutingPage> createState() => _RoutingPageState();
}

class _RoutingPageState extends State<RoutingPage>
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
            ? NavigationPage(isEmployee: state.isEmployee)
            : const IntroPage(),
      ),
    ),
  );
}

typedef RoutingScreen = RoutingPage;
