import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/image_picker_helper.dart';
import 'package:hr_app/src/core/shared_widgets/s_text_field.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';

class Form2 extends StatelessWidget {
  const Form2({super.key});
  @override
  Widget build(BuildContext context) {
    Future<File?> pickImage() async {
      return ImagePickerHelper.pickAndCropImage(context: context);
    }

    final bloc = context.read<AuthBloc>();
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        StatefulBuilder(builder: (context, changeState) {
          final profileImg = bloc.profileImage;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.r),
            child: GestureDetector(
              onTap: () async {
                final image = await pickImage();
                if (image != null) {
                  bloc.profileImage = image;
                  changeState(() {});
                }
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 105.r,
                    height: 105.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.primaryColor.withValues(alpha: 0.06),
                      border: Border.all(
                        color: theme.primaryColor.withValues(alpha: 0.85),
                        width: 2.5.r,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.primaryColor.withValues(alpha: 0.15),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: profileImg != null
                          ? Image.file(
                              profileImg,
                              width: 105.r,
                              height: 105.r,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Icon(
                                Icons.person_outline_rounded,
                                size: 55.r,
                                color: theme.primaryColor.withValues(alpha: 0.6),
                              ),
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 2.r,
                    right: 2.r,
                    child: Container(
                      padding: EdgeInsets.all(7.r),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.5.r,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        size: 16.r,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
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
