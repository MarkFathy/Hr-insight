import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hr_app/src/core/shared_widgets/button_indicator.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text_field.dart';
import 'package:hr_app/src/core/shared_widgets/snake_bar.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/map_picker.dart';
import 'package:hr_app/src/injector.dart';

class OfficeForm extends StatelessWidget {
  final Function() rebuild;
  final OfficeDataEntity? data;
  const OfficeForm({super.key, required this.rebuild, this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      child: BlocProvider(
        create: (context) => sl<OfficesBloc>(),
        child: BlocConsumer<OfficesBloc, OfficesState>(
          listener: (context, state) {
            if (state is OfficesModifiedState) {
              rebuild();
              NV.pop(context);
            }
          },
          builder: (context, state) {
            final bloc = context.read<OfficesBloc>();
            final formKey = GlobalKey<FormState>();
            if (data != null) {
              bloc.nameCtrl.text = data!.name!;
              bloc.radiusCtrl.text = data!.radius.toString();
              bloc.location = LatLng(data!.lat!, data!.lng!);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  color: theme.colorScheme.secondary,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10),
                        child: InkWell(
                          onTap: () => NV.pop(context),
                          child: Icon(
                            Icons.close_rounded,
                            color: theme.primaryColor,
                          ),
                        ),
                      ),
                      Text(data != null ? 'تعديل مكتب' : 'إضافة مكتب')
                    ],
                  ),
                ),
                MapPicker(
                    oldLoc:
                        (data != null) ? LatLng(data!.lat!, data!.lng!) : null),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        if (state is OfficesErrorState)
                          Text(
                            state.message,
                            style: theme.textTheme.labelMedium!
                                .copyWith(color: Colors.red),
                          ),
                        STextField(
                          lable: 'إسم المكتب',
                          controller: bloc.nameCtrl..text,
                        ),
                        STextField(
                            lable: "مساحة التوقيع",
                            controller: bloc.radiusCtrl,
                            type: TextInputType.number),
                        state is OfficesLoadingState
                            ? const ButtonIncdicator()
                            : SButton(
                                title: data != null ? 'تعديل' : 'إضافة',
                                onTap: () {
                                  if (!formKey.currentState!.validate()) return;
                                  if (bloc.location == null) {
                                    showBar('اختر الموقع', context);
                                    return;
                                  }
                                  bloc.add(data != null
                                      ? EditOfficeEvent(id: data!.id!)
                                      : const AddOfficeEvent());
                                })
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
