import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/utils/image_picker_helper.dart';
import 'package:hr_app/core/widgets/app_text_field.dart';
import 'package:hr_app/features/authentication/presentation/bloc/bloc.dart';

class EmployeeAccountInfoStep extends StatelessWidget {
  const EmployeeAccountInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    Future<File?> pickImage() async =>
        ImagePickerHelper.pickAndCropImage(context: context);

    final bloc = context.read<AuthBloc>();
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StatefulBuilder(
            builder: (context, changeState) {
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
                                    color: theme.primaryColor.withValues(
                                      alpha: 0.6,
                                    ),
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
            },
          ),
          AppTextField(label: 'اسم المستخدم', controller: bloc.nameCtrl),
          AppTextField(
            label: 'البريد الالكتروني',
            controller: bloc.emailCtrl,
            isEmail: true,
          ),
          AppTextField(label: 'العنوان', controller: bloc.addressCtrl),
          AppTextField(
            label: 'الهاتف',
            controller: bloc.phoneCtrl,
            isMobile: true,
          ),
          AppTextField(
            label: 'كلمه المرور',
            controller: bloc.passwordCtrl,
            isPassword: true,
          ),
          AppTextField(
            label: 'تأكيد كلمه المرور',
            controller: bloc.confirmPasswordCtrl,
            isPassword: true,
          ),
        ],
      ),
    );
  }
}

/// Backwards compatibility alias
typedef Form2 = EmployeeAccountInfoStep;
