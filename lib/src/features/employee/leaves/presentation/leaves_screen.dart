import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/components/card_indicator.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/components/leave_card.dart';
import 'package:hr_app/src/injector.dart';

class LeavesScreen extends StatelessWidget {
  static const routeName = '/leaves';
  const LeavesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LeavesBloc>()..add(GetLeavesEvent()),
      child: BlocConsumer<LeavesBloc, LeavesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('طلبات الإجازات'),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    10.ph,
                    if (state is LeavesLoadingState)
                      ...List.generate(
                        10,
                        (index) => const ListIndicator(),
                      ),
                    if (state is LeavesLoadedState)
                      ...state.leaves.data!
                          .map((e) => LeaveCard(leave: e))
                          .toList()
                          .reversed
                  ],
                ),
              ));
        },
      ),
    );
  }
}
