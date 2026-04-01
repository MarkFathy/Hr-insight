import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/s_back_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/office_card.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/office_form.dart';
import 'package:hr_app/src/injector.dart';

class OfficesScreen extends StatelessWidget {
  static const routeName = '/offices';
  const OfficesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OfficesBloc>()..add(const GetOfficesEvent()),
      child: BlocConsumer<OfficesBloc, OfficesState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = context.read<OfficesBloc>();
          return Scaffold(
              appBar: AppBar(
                title: const SText('المكاتب'),
                leading: const SBackButton(),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () async {
                        bool sucess = false;
                        await showDialog(
                          context: context,
                          builder: (context) => OfficeForm(
                            rebuild: () {
                              sucess = true;
                            },
                          ),
                        );
                        if (sucess) {
                          bloc.add(const GetOfficesEvent());
                        }
                      },
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColor,
                      ))
                ],
              ),
              body: (state is OfficesLoadedState && bloc.offices!.data!.isEmpty)
                  ? Center(
                      child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 58.r),
                      child: const Text('لم يتم اضافة مكتب بعد'),
                    ))
                  : GridView(
                      padding: const EdgeInsets.all(5),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8),
                      children: [
                          if (state is OfficesLoadingState)
                            ...List.generate(
                                    10, (index) => const OfficesIndicator())
                                .toList(),
                          if (state is OfficesLoadedState) ...[
                            if (state.offices.data!.isNotEmpty)
                              ...state.offices.data!
                                  .map((e) => OfficeCard(office: e)),
                          ],
                        ]));
        },
      ),
    );
  }
}
