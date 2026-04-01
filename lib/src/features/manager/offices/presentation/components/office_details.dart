import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hr_app/src/core/shared_widgets/s_back_button.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/manager/employees/presentation/components/emplyee_card.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/map_view.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/office_form.dart';
import 'package:hr_app/src/injector.dart';

class OfficeDetailsScreen extends StatelessWidget {
  final OfficeDataEntity office;
  final Function() rebuild;
  const OfficeDetailsScreen(
      {super.key, required this.office, required this.rebuild});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) =>
          sl<OfficesBloc>()..add(GetOfficeDetailsEvent(office.id!)),
      child: BlocConsumer<OfficesBloc, OfficesState>(
        listener: (context, state) {
          if (state is OfficesModifiedState) {
            rebuild();
            NV.pop(context);
          }
        },
        builder: (context, state) {
          final bloc = context.read<OfficesBloc>();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: const SBackButton(),
              title: Text(office.name!),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => OfficeForm(
                          rebuild: () {
                            rebuild();
                            NV.pop(context);
                          },
                          data: office,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      color: theme.primaryColor,
                    )),
                IconButton(
                    onPressed: () {
                      showAdaptiveDialog(
                          context: context,
                          builder: (context) => AlertDialog.adaptive(
                                content: const Text(
                                    'سيتم حذف المكتب نهائيا, هل انت متاكد ؟'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        bloc.add(
                                            DeleteOfficesEvent(office.id!));
                                        NV.pop(context);
                                      },
                                      child: const Text('حذف')),
                                  TextButton(
                                      onPressed: () {
                                        NV.pop(context);
                                      },
                                      child: const Text('إلغاء'))
                                ],
                              ));
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ],
            ),
            body: Column(
              children: [
                SizedBox(
                    height: size.height * .4,
                    child: Material(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: MapViewScreen(
                          location: LatLng(office.lat!, office.lng!)),
                    )),
                18.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Chip(
                        backgroundColor: theme.colorScheme.secondary,
                        label: Row(
                          children: [
                            Icon(
                              Icons.radar,
                              color: theme.primaryColor,
                            ),
                            10.pw,
                            Text('المدى : ${office.radius}')
                          ],
                        )),
                    Chip(
                        backgroundColor: theme.colorScheme.secondary,
                        label: Row(
                          children: [
                            Icon(Icons.person_3_outlined,
                                color: theme.primaryColor),
                            10.pw,
                            Text('عدد الموظفين : ${office.employeeCount}')
                          ],
                        )),
                  ],
                ),
                20.ph,
                Center(
                  child: Text(
                    'الموظفين',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                const Divider(),
                if (state is OfficeDetailsLoadedState &&
                    state.details.data!.employees!.isEmpty)
                  const Text('لا يوجد موظفين'),
                Divider(
                  color: theme.primaryColor,
                  thickness: 2,
                  height: 0,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      if (state is OfficesLoadingState)
                        ...List.generate(
                            10, (index) => const EmployeeIndicator()).toList(),
                      if (state is OfficeDetailsLoadedState) ...[
                        if (state.details.data!.employees!.isNotEmpty)
                          ...state.details.data!.employees!.map((e) => Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child:
                                    EmployeeCard(employee: e, inOffice: true),
                              )),
                      ],
                    ]),
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
