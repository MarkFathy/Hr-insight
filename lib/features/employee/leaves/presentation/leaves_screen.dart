import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/widgets/app_back_button.dart';
import 'package:hr_app/core/widgets/app_empty_state.dart';
import 'package:hr_app/core/widgets/app_error_state.dart';
import 'package:hr_app/features/employee/leaves/presentation/bloc/bloc.dart';
import 'package:hr_app/features/employee/leaves/presentation/components/card_indicator.dart';
import 'package:hr_app/features/employee/leaves/presentation/components/leave_card.dart';
import 'package:hr_app/features/employee/leaves/presentation/components/leave_form.dart';

class LeavesScreen extends StatefulWidget {
  static const routeName = '/leaves';
  const LeavesScreen({super.key});

  @override
  State<LeavesScreen> createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen>
    with AutoConnectivityRestoreMixin {
  late final LeavesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<LeavesBloc>()..add(const GetLeavesEvent());
  }

  @override
  void onConnectivityRestored() {
    _bloc.add(const GetLeavesEvent());
  }

  @override
  void dispose() {
    unawaited(_bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: _bloc,
    child: Builder(
      builder: (screenCtx) => Scaffold(
        appBar: AppBar(
          title: const Text('طلبات الإجازات'),
          leading: const AppBackButton(),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await showDialog<void>(
              context: screenCtx,
              builder: (ctx) => const LeaveForm(),
            );
            if (screenCtx.mounted) {
              screenCtx.read<LeavesBloc>().add(const GetLeavesEvent());
            }
          },
          backgroundColor: screenCtx.colors.primary,
          foregroundColor: Colors.black,
          icon: const Icon(Icons.add_rounded),
          label: Text(
            'طلب إجازة',
            style: screenCtx.typography.labelLarge.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: RefreshIndicator(
          color: screenCtx.colors.primary,
          backgroundColor: screenCtx.colors.surface,
          onRefresh: () async {
            final bloc = screenCtx.read<LeavesBloc>();
            final completer = Completer<void>();
            late final StreamSubscription<LeavesState> sub;
            sub = bloc.stream.listen((state) {
              if (state is! LeavesLoadingState) {
                if (!completer.isCompleted) completer.complete();
                unawaited(sub.cancel());
              }
            });
            bloc.add(const GetLeavesEvent());
            await completer.future.timeout(
              const Duration(seconds: 4),
              onTimeout: () {
                if (!completer.isCompleted) completer.complete();
                unawaited(sub.cancel());
              },
            );
          },
          child: BlocBuilder<LeavesBloc, LeavesState>(
            buildWhen: (prev, curr) =>
                curr is LeavesLoadingState ||
                curr is LeavesLoadedState ||
                curr is LeavesErrorState,
            builder: (context, state) {
              if (state is LeavesLoadingState) {
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 96),
                  itemCount: 6,
                  itemBuilder: (context, index) => const ListIndicator(),
                );
              }

              if (state is LeavesLoadedState) {
                final leavesList = state.leaves.data ?? [];
                if (leavesList.isEmpty) {
                  return LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: AppEmptyState(
                          icon: Icons.beach_access_rounded,
                          title: 'لا توجد طلبات إجازة سابقة',
                          subtitle:
                              'يمكنك تقديم طلب إجازة اعتيادية أو عارضة الآن',
                          actionLabel: 'تقديم طلب إجازة',
                          onAction: () async {
                            await showDialog<void>(
                              context: screenCtx,
                              builder: (ctx) => const LeaveForm(),
                            );
                            if (screenCtx.mounted) {
                              screenCtx.read<LeavesBloc>().add(
                                const GetLeavesEvent(),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 96),
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: leavesList.length,
                  itemBuilder: (context, index) => LeaveCard(
                    leave: leavesList[leavesList.length - 1 - index],
                  ),
                );
              }

              if (state is LeavesErrorState) {
                return LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: AppErrorState(
                        message: state.message,
                        onRetry: () => screenCtx.read<LeavesBloc>().add(
                          const GetLeavesEvent(),
                        ),
                      ),
                    ),
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    ),
  );
}
