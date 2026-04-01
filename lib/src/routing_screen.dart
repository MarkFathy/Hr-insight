import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/home/navigation_screen.dart';
import 'package:hr_app/src/features/intro/intro.dart';
import 'package:hr_app/src/injector.dart';

class RoutingScreen extends StatelessWidget {
  static const routeName = '/routing';
  const RoutingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>()..add(AutoLoginEvent()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return (state is AuthLoadingState)
              ? const Center(child: CircularProgressIndicator())
              : (state is AuthLoadingState)
                  ? const Center(child: CircularProgressIndicator())
                  : state is AuthSuccessState
                      ? NavigationScreen(isEmployee: state.isEmployee)
                      : const IntroScreen();
        },
      ),
    );
  }
}
