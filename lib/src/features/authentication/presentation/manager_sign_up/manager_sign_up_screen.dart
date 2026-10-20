import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/di/service_locator.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/utils/image_picker_helper.dart';
import 'package:hr_app/src/core/utils/navigation_helper.dart';
import 'package:hr_app/src/core/widgets/app_back_button.dart';
import 'package:hr_app/src/core/widgets/app_button.dart';
import 'package:hr_app/src/core/widgets/app_indicator.dart';
import 'package:hr_app/src/core/widgets/app_snack_bar.dart';
import 'package:hr_app/src/core/widgets/app_text_field.dart';
import 'package:hr_app/src/core/widgets/button_indicator.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:hr_app/src/routing_screen.dart';

class ManagerSignUpScreen extends StatefulWidget {
  static const routeName = '/manager-signup';
  const ManagerSignUpScreen({super.key});

  @override
  State<ManagerSignUpScreen> createState() => _ManagerSignUpScreenState();
}

class _ManagerSignUpScreenState extends State<ManagerSignUpScreen> {
  Future<File?> pickImage() async => ImagePickerHelper.pickAndCropImage(context: context);

  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailureState) {
              showBar(state.error, context);
            }
            if (state is AuthSuccessState) {
              NavigationHelper.nextScreenCloseOthersNamed(
                context,
                RoutingScreen.routeName,
              );
            }
          },
          child: Builder(
            builder: (context) {
              final bloc = context.read<AuthBloc>();
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'إنشاء حساب',
                    style: context.typography.titleLarge.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  centerTitle: true,
                  leading: const AppBackButton(),
                ),
                body: Form(
                  key: bloc.formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: BlocSelector<AuthBloc, AuthState, EmailVerifiedState?>(
                        selector: (state) =>
                            state is EmailVerifiedState ? state : null,
                        builder: (context, verifiedState) {
                          if (verifiedState != null) {
                            return Column(
                              children: [
                                20.ph,
                                Text(
                                  'تم إرسال رمز التحقق الى : ${verifiedState.manager!.data!.manager!.email!}',
                                ),
                                20.ph,
                                AppTextField(
                                  label: 'رمز التحقق',
                                  controller: bloc.verificationCode,
                                ),
                                BlocSelector<AuthBloc, AuthState, bool>(
                                  selector: (state) =>
                                      state is AuthLoadingState,
                                  builder: (context, isLoading) => isLoading
                                        ? const AppIndicator()
                                        : AppButton(
                                            title: 'تأكيد',
                                            onTap: () {
                                              if (!bloc.formKey.currentState!
                                                  .validate()) {
                                                return;
                                              }
                                              bloc.add(
                                                VerifyEmailEvent(
                                                  VerifyParams(
                                                    email: verifiedState
                                                        .manager!
                                                        .data!
                                                        .manager!
                                                        .email!,
                                                    otp: bloc
                                                        .verificationCode
                                                        .text,
                                                    isEmployee: false,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                ),
                              ],
                            );
                          }

                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 18.h,
                                ),
                                child: Column(
                                  children: [
                                    StatefulBuilder(
                                      builder: (context, changeState) {
                                        final profileImg = bloc.profileImage;
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8.h,
                                          ),
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
                                                    color: context
                                                        .colors
                                                        .primary
                                                        .withValues(
                                                          alpha: 0.06,
                                                        ),
                                                    border: Border.all(
                                                      color: context
                                                          .colors
                                                          .primary
                                                          .withValues(
                                                            alpha: 0.85,
                                                          ),
                                                      width: 2.5.r,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: context
                                                            .colors
                                                            .primary
                                                            .withValues(
                                                              alpha: 0.15,
                                                            ),
                                                        blurRadius: 16,
                                                        offset: const Offset(
                                                          0,
                                                          6,
                                                        ),
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
                                                              Icons
                                                                  .person_outline_rounded,
                                                              size: 55.r,
                                                              color: context
                                                                  .colors
                                                                  .primary
                                                                  .withValues(
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
                                                    padding: EdgeInsets.all(
                                                      7.r,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: context
                                                          .colors
                                                          .primary,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: context
                                                            .colors
                                                            .surface,
                                                        width: 2.5.r,
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withValues(
                                                                alpha: 0.15,
                                                              ),
                                                          blurRadius: 6,
                                                          offset: const Offset(
                                                            0,
                                                            2,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    child: const Icon(
                                                      Icons.camera_alt_rounded,
                                                      size: 16,
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
                                    AppTextField(
                                      label: 'اسم المستخدم',
                                      controller: bloc.nameCtrl,
                                    ),
                                    AppTextField(
                                      label: 'البريد الالكتروني',
                                      controller: bloc.emailCtrl,
                                      isEmail: true,
                                    ),
                                    AppTextField(
                                      label: 'اسم الشركة',
                                      controller: bloc.companyCtrl,
                                    ),
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
                              ),
                              BlocSelector<AuthBloc, AuthState, bool>(
                                selector: (state) => state is AuthLoadingState,
                                builder: (context, isLoading) => isLoading
                                      ? const ButtonIndicator()
                                      : AppButton(
                                          title: 'إنشاء حساب',
                                          onTap: () {
                                            if (!bloc.formKey.currentState!
                                                .validate()) {
                                              return;
                                            }
                                            if (bloc.profileImage == null) {
                                              showBar(
                                                'اضف صورة شخصية',
                                                context,
                                              );
                                              return;
                                            }
                                            bloc.add(const ManagerSignUpEvent());
                                          },
                                        ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'لديك حساب بالفعل؟ ',
                                    style: context.typography.bodySmall.copyWith(
                                      color: context.colors.textPrimary,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        NavigationHelper.nextScreenReplaceNamed(
                                          context,
                                          SignInScreen.routeName,
                                          args: false,
                                        ),
                                    child: Text(
                                      'تسجيل الدخول',
                                      style: context.typography.bodySmall.copyWith(
                                        color: context.colors.primary,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).viewInsets.bottom /
                                    4,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
}
