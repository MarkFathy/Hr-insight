import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/constants/app_constants.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/animated_switch.dart';
import 'package:hr_app/core/shared/widgets/app_text_field.dart';
import 'package:hr_app/core/utils/entrance_fader.dart';
import 'package:hr_app/features/authentication/presentation/bloc/auth_bloc.dart';

class EmployeeWorkInfoStep extends StatelessWidget {
  const EmployeeWorkInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthBloc>();
    return SingleChildScrollView(
      child: StatefulBuilder(
        builder: (context, changeState) => Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(1, 0, 0, 36),
              child: Text(
                'إنشاء حساب موظف',
                style: context.typography.titleMedium.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            10.ph,
            AnimatedSwitch(
              child: (bloc.info != null)
                  ? Material(
                      color: MyColors.greyColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'المدير : ${bloc.info!.data!.manager.name!}',
                                ),
                                Text(
                                  'اسم الشركة : ${bloc.info!.data!.manager.company!}',
                                ),
                                Text(
                                  'البريد : ${bloc.info!.data!.manager.email!}',
                                ),
                                Text(
                                  'الهاتف : ${bloc.info!.data!.manager.phone!}',
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    bloc
                                        .info
                                        ?.data
                                        ?.manager
                                        .image
                                        .toValidImageUrl ??
                                    '',
                                imageBuilder: (context, imageProvider) =>
                                    EntranceFader(
                                      offset: const Offset(-5, -10),
                                      child: Container(
                                        clipBehavior: Clip.hardEdge,
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.shade700,
                                          image: DecorationImage(
                                            image: imageProvider,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade700,
                                              blurRadius: 7,
                                              spreadRadius: 5,
                                              blurStyle: BlurStyle.inner,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                placeholder: (context, url) =>
                                    const Icon(Icons.person_2_outlined),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            label: 'كود المدير',
                            controller: bloc.managerPin,
                          ),
                        ),
                        if (bloc.info == null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: (bloc.state is AuthLoadingState)
                                ? SizedBox(
                                    width: 28,
                                    height: 28,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(
                                        context,
                                      ).primaryColor,
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 12,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (bloc.managerPin.text.trim().isEmpty) {
                                        return;
                                      }
                                      context.read<AuthBloc>().add(
                                        const GetDepartmentsEvent(),
                                      );
                                    },
                                    child: const Icon(Icons.done_rounded),
                                  ),
                          ),
                      ],
                    ),
            ),
            if (bloc.info != null) ...[
              10.ph,
              const Text('اختر البيانات التالية'),
              10.ph,
              DropdownButtonFormField<int>(
                dropdownColor: MyColors.greyColor,
                hint: const Text('اختر القسم'),
                initialValue: bloc.departId,
                items: bloc.info!.data!.departments
                    .map(
                      (e) => DropdownMenuItem<int>(
                        value: e.id,
                        child: Text(e.name!),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  changeState(() {
                    bloc
                      ..departId = value
                      ..jobId = null;
                  });
                },
              ),
              if (bloc.departId != null) ...[
                15.ph,
                DropdownButtonFormField<int>(
                  dropdownColor: MyColors.greyColor,
                  hint: const Text('اختر المسمى الوظيفى'),
                  initialValue: bloc.jobId,
                  items: bloc.info!.data!.departments
                      .firstWhere((element) => element.id == bloc.departId)
                      .jobs!
                      .map(
                        (e) => DropdownMenuItem<int>(
                          value: e.id,
                          child: Text(e.title!),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    changeState(() {
                      bloc.jobId = value;
                    });
                  },
                ),
              ],
              if (bloc.info!.data!.offices.isNotEmpty) ...[
                15.ph,
                DropdownButtonFormField<int>(
                  dropdownColor: MyColors.greyColor,
                  hint: const Text('اختر المكتب'),
                  initialValue: bloc.officeId,
                  items: bloc.info!.data!.offices
                      .map(
                        (e) => DropdownMenuItem<int>(
                          value: e.id,
                          child: Text(e.name!),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    changeState(() {
                      bloc.officeId = value;
                    });
                  },
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
