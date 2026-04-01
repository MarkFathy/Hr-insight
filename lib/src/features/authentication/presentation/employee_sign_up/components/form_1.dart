import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/shared_widgets/animated_swich.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';
import 'package:hr_app/src/core/shared_widgets/s_text_field.dart';
import 'package:hr_app/src/core/utils/entrance_fader.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';

class Form1 extends StatelessWidget {
  const Form1({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthBloc>();
    return SingleChildScrollView(
      child: StatefulBuilder(builder: (context, changeState) {
        return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(1.r, 0.r, 0.r, 37.r),
                child: const SText('إنشاء حساب موظف'),
              ),
              10.ph,
              AnimatedSwitch(
                child: (bloc.info != null)
                    ? Material(
                  color: MyColors.greyColor,
                        child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "المدير : ${bloc.info!.data!.manager.name!}"),
                                Text(
                                    "اسم الشركة : ${bloc.info!.data!.manager.company!}"),
                                Text(
                                    "البريد : ${bloc.info!.data!.manager.email!}"),
                                Text(
                                    "الهاتف : ${bloc.info!.data!.manager.phone!}"),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: CachedNetworkImage(
                                imageUrl: bloc.info!.data!.manager.image!,
                                imageBuilder: (context, imageProvider) =>
                                    EntranceFader(
                                  offset: const Offset(-5, -10),
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    width: 50.r,
                                    height: 50.r,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade700,
                                        image: DecorationImage(
                                            image: imageProvider),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade700,
                                              blurRadius: 7,
                                              spreadRadius: 5,
                                              blurStyle: BlurStyle.inner)
                                        ]),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    const Icon(Icons.person_2_outlined),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            )
                          ],
                        ),
                      ))
                    : Row(
                        children: [
                          Expanded(
                            child: STextField(
                              lable: 'كود المدير',
                              controller: bloc.managerPin,
                            ),
                          ),
                          if (bloc.info == null)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ElevatedButton(
                                  onPressed: () => context
                                      .read<AuthBloc>()
                                      .add(GetDepartmentsEvent()),
                                  child: const Icon(Icons.done)),
                            )
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
                  value: bloc.departId,
                  items: bloc.info!.data!.departments
                      .map((e) => DropdownMenuItem<int>(
                            value: e.id,
                            child: Text(e.name!),
                          ))
                      .toList(),
                  onChanged: (value) {
                    changeState(() {
                      bloc.departId = value;
                      bloc.jobId = null;
                    });
                  },
                ),
                15.ph,
                if (bloc.departId != null)
                  DropdownButtonFormField(
                    dropdownColor: MyColors.greyColor,
                    hint: const Text('اختر المسمى الوظيفى'),
                    value: bloc.jobId,
                    items: bloc.info!.data!.departments
                        .firstWhere((element) => element.id == bloc.departId)
                        .jobs!
                        .map((e) => DropdownMenuItem<int>(
                              value: e.id,
                              child: Text(e.title!),
                            ))
                        .toList(),
                    onChanged: (value) {
                      changeState(() {
                        bloc.jobId = value;
                      });
                    },
                  ),
                if (bloc.info!.data!.offices.isNotEmpty)
                  DropdownButtonFormField(
                    dropdownColor: MyColors.greyColor,
                    hint: const Text('اختر المكتب'),
                    value: bloc.officeId,
                    items: bloc.info!.data!.offices
                        .map((e) => DropdownMenuItem<int>(
                              value: e.id,
                              child: Text(e.name!),
                            ))
                        .toList(),
                    onChanged: (value) {
                      changeState(() {
                        bloc.officeId = value;
                      });
                    },
                  ),
              ]
            ]);
      }),
    );
  }
}
