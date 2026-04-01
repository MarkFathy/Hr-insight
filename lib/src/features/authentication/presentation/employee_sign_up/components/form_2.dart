import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hr_app/src/core/shared_widgets/s_text_field.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';

class Form2 extends StatelessWidget {
  const Form2({super.key});
  @override
  Widget build(BuildContext context) {
    Future<File> pickImage() async {
      return File(await ImagePicker()
          .pickImage(source: ImageSource.gallery)
          .then((value) => value!.path));
    }

    final bloc = context.read<AuthBloc>();
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        StatefulBuilder(builder: (context, changeState) {
          return Padding(
            padding: EdgeInsets.all(10.r),
            child: InkWell(
              onTap: () async {
                context.read<AuthBloc>().profileImage = await pickImage();
                changeState(() {});
              },
              child: Material(
                color: Colors.grey.shade200,
                shape: const CircleBorder(),
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: EdgeInsets.all(12.r),
                  child: context.read<AuthBloc>().profileImage != null
                      ? Image.file(context.read<AuthBloc>().profileImage!,
                          width: 50.r)
                      : Icon(
                          Icons.face,
                          size: 50.r,
                        ),
                ),
              ),
            ),
          );
        }),
        STextField(
          lable: 'اسم المستخدم',
          controller: bloc.nameCtrl,
        ),
        STextField(
          lable: 'البريد الالكتروني',
          controller: bloc.emailCtrl,
          isEmail: true,
        ),
        STextField(
          lable: 'العنوان',
          controller: bloc.addressCtrl,
        ),
        STextField(
          lable: 'الهاتف',
          controller: bloc.phoneCtrl,
          isMobile: true,
        ),
        STextField(
          lable: 'كلمه المرور',
          controller: bloc.passwordCtrl,
          isPassword: true,
        ),
        STextField(
          lable: 'تأكيد كلمه المرور',
          controller: bloc.confirmPasswordCtrl,
          isPassword: true,
        ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Expanded(
        //       child: STextField(
        //         lable: "تفاصيل المهنة",
        //         controller: bloc.careerDescriptionCtrl,
        //         isMultiLine: true,
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(12.0),
        //       child: Card(
        //         elevation: 6,
        //         child: Padding(
        //           padding: EdgeInsets.all(18.r),
        //           child: Column(
        //               mainAxisAlignment: MainAxisAlignment.spaceAround,
        //               children: [
        //                 StatefulBuilder(builder: (context, changeState) {
        //                   return Padding(
        //                     padding: EdgeInsets.all(10.r),
        //                     child: context.read<AuthBloc>().profileImage != null
        //                         ? Image.file(
        //                             context.read<AuthBloc>().profileImage!,
        //                             width: 50.r)
        //                         : InkWell(
        //                             onTap: () async {
        //                               context.read<AuthBloc>().profileImage =
        //                                   await pickImage();
        //                               changeState(() {});
        //                             },
        //                             child: Image.asset(
        //                               AppImages.imagePlaceHolder,
        //                               width: 40.r,
        //                             ),
        //                           ),
        //                   );
        //                 }),
        //                 SText(
        //                   'صورة الخدمة',
        //                   fontSize: 10.r,
        //                 )
        //               ]),
        //         ),
        //       ),
        //     ),
        //   ],
        // )
      ]),
    );
  }
}
