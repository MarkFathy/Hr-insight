import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/core/widgets/app_back_button.dart';
import 'package:hr_app/core/widgets/app_empty_state.dart';
import 'package:hr_app/core/widgets/app_error_state.dart';
import 'package:hr_app/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/features/manager/offices/presentation/components/office_card.dart';
import 'package:hr_app/features/manager/offices/presentation/components/office_form.dart';

class OfficesScreen extends StatefulWidget {
  static const routeName = '/offices';
  const OfficesScreen({super.key});

  @override
  State<OfficesScreen> createState() => _OfficesScreenState();
}

class _OfficesScreenState extends State<OfficesScreen>
    with AutoConnectivityRestoreMixin {
  late final OfficesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<OfficesBloc>()..add(const GetOfficesEvent());
  }

  @override
  void onConnectivityRestored() {
    _bloc.add(const GetOfficesEvent());
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
          title: const Text('فروع ومكاتب الشركة'),
          leading: const AppBackButton(),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: screenCtx.colors.primary,
          foregroundColor: Colors.black,
          elevation: 4,
          icon: const Icon(Icons.add_location_alt_rounded),
          label: Text(
            'إضافة مكتب',
            style: screenCtx.typography.labelLarge.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          onPressed: () => _openOfficeForm(screenCtx),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            color: screenCtx.colors.primary,
            backgroundColor: screenCtx.colors.surface,
            onRefresh: () async {
              screenCtx.read<OfficesBloc>().add(const GetOfficesEvent());
            },
            child: BlocBuilder<OfficesBloc, OfficesState>(
              buildWhen: (prev, curr) =>
                  curr is OfficesLoadingState ||
                  curr is OfficesLoadedState ||
                  curr is OfficesErrorState,
              builder: (context, state) {
                if (state is OfficesLoadingState) {
                  return GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                        ),
                    itemCount: 6,
                    itemBuilder: (context, index) => const OfficesIndicator(),
                  );
                }

                if (state is OfficesLoadedState) {
                  final officeList = state.offices.data ?? [];
                  if (officeList.isEmpty) {
                    return LayoutBuilder(
                      builder: (context, constraints) => SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: const AppEmptyState(
                            icon: Icons.location_off_rounded,
                            title: 'لم يتم إضافة مكاتب بعد',
                            subtitle:
                                'أضف فروع الشركة ومواقعها الجغرافية لتحديد نطاق الحضور والانصراف بدقة',
                          ),
                        ),
                      ),
                    );
                  }

                  return GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                        ),
                    itemCount: officeList.length,
                    itemBuilder: (context, index) =>
                        OfficeCard(office: officeList[index]),
                  );
                }

                if (state is OfficesErrorState) {
                  return LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: AppErrorState(
                          message: state.message,
                          onRetry: () => screenCtx.read<OfficesBloc>().add(
                            const GetOfficesEvent(),
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
    ),
  );

  Future<void> _openOfficeForm(BuildContext context) async {
    final bloc = context.read<OfficesBloc>();
    final success = await NavigationHelper.nextScreen<bool>(
      context,
      OfficeForm(
        rebuild: () {
          bloc.add(const GetOfficesEvent());
        },
      ),
    );
    if ((success ?? false) && context.mounted) {
      bloc.add(const GetOfficesEvent());
    }
  }
}
