import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/s_back_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/office_card.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/office_form.dart';
import 'package:hr_app/src/injector.dart';

class OfficesScreen extends StatelessWidget {
  static const routeName = '/offices';
  const OfficesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => sl<OfficesBloc>()..add(const GetOfficesEvent()),
      child: BlocConsumer<OfficesBloc, OfficesState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = context.read<OfficesBloc>();
          final officeList = bloc.offices?.data ?? [];

          return Scaffold(
            appBar: AppBar(
              title: const SText('فروع ومكاتب الشركة'),
              leading: const SBackButton(),
              centerTitle: true,
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.r),
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: theme.primaryColor.withValues(alpha: 0.15),
                    ),
                    icon: Icon(
                      Icons.add_location_alt_rounded,
                      color: theme.primaryColor,
                      size: 22.r,
                    ),
                    tooltip: 'إضافة فرع / مكتب',
                    onPressed: () => _openOfficeForm(context, bloc),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: theme.primaryColor,
              foregroundColor: Colors.black,
              icon: const Icon(Icons.add_location_alt_rounded),
              label: const Text(
                'إضافة مكتب',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () => _openOfficeForm(context, bloc),
            ),
            body: SafeArea(
              bottom: true,
              child: RefreshIndicator(
                color: theme.primaryColor,
                backgroundColor: theme.colorScheme.secondary,
                onRefresh: () async {
                  bloc.add(const GetOfficesEvent());
                },
                child: (state is OfficesLoadedState && officeList.isEmpty)
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.all(24.r),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: theme.primaryColor.withValues(alpha: 0.1),
                                ),
                                child: Icon(
                                  Icons.location_off_rounded,
                                  size: 48.r,
                                  color: theme.primaryColor.withValues(alpha: 0.7),
                                ),
                              ),
                              16.ph,
                              const Text(
                                'لم يتم إضافة مكاتب بعد',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              6.ph,
                              Text(
                                'أضف فروع الشركة ومواقعها الجغرافية لتحديد نطاق الحضور والانصراف',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  fontSize: 12,
                                ),
                              ),
                              18.ph,
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.primaryColor,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.r,
                                    vertical: 10.r,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                onPressed: () => _openOfficeForm(context, bloc),
                                icon: const Icon(Icons.add_location_alt_rounded),
                                label: const Text(
                                  'إضافة أول مكتب',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.fromLTRB(10.r, 10.r, 10.r, 80.r),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.88,
                          mainAxisSpacing: 10.r,
                          crossAxisSpacing: 10.r,
                        ),
                        itemCount: state is OfficesLoadingState ? 6 : officeList.length,
                        itemBuilder: (context, index) {
                          if (state is OfficesLoadingState) {
                            return const OfficesIndicator();
                          }
                          return OfficeCard(office: officeList[index]);
                        },
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _openOfficeForm(BuildContext context, OfficesBloc bloc) async {
    bool success = false;
    await showDialog(
      context: context,
      builder: (context) => OfficeForm(
        rebuild: () {
          success = true;
        },
      ),
    );
    if (success) {
      bloc.add(const GetOfficesEvent());
    }
  }
}
