import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/app_indicator.dart';
import 'package:hr_app/src/core/shared_widgets/button_indicator.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';
import 'package:hr_app/src/core/shared_widgets/s_text_field.dart';
import 'package:hr_app/src/core/shared_widgets/snake_bar.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/core/utils/image_picker_helper.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/authentication/presentation/sign_in/sign_in.dart';
import 'package:hr_app/src/injector.dart';

class ManagerSignUpScreen extends StatefulWidget {
  static const routeName = '/manager-signup';
  const ManagerSignUpScreen({super.key});

  @override
  State<ManagerSignUpScreen> createState() => _ManagerSignUpScreenState();
}

class _ManagerSignUpScreenState extends State<ManagerSignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<File?> pickImage() async {
    return ImagePickerHelper.pickAndCropImage(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailureState) {
              showBar(state.error, context);
            }
            if (state is AuthSuccessState) {
              Phoenix.rebirth(context);
            }
          },
          builder: (context, state) {
            final bloc = context.read<AuthBloc>();
            return Scaffold(
              appBar: AppBar(
                  title: const SText('إنشاء حساب'),
                  centerTitle: true,
                  leading: IconButton(
                      onPressed: () => NV.pop(context),
                      icon: const Icon(Icons.arrow_back_ios))),
              body: Form(
                key: bloc.formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                    child: state is EmailVerifiedState
                        ? Column(
                            children: [
                              20.ph,
                              Text(
                                  'تم إرسال رمز التحقق الى : ${state.manager!.data!.manager!.email!}'),
                              20.ph,
                              STextField(
                                lable: 'رمز التحقق',
                                controller: bloc.verificationCode,
                              ),
                              state is AuthLoadingState
                                  ? const AppIndicator()
                                  : SButton(
                                      title: 'تأكيد',
                                      onTap: () {
                                        if (!bloc.formKey.currentState!
                                            .validate()) {
                                          return;
                                        }
                                        bloc.add(VerifyEmailEvent(VerifyParams(
                                            email: state
                                                .manager!.data!.manager!.email!,
                                            otp: bloc.verificationCode.text,
                                            isEmployee: false)));
                                      }),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18.0),
                                child: Column(
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
                                      lable: 'اسم الشركة',
                                      controller: bloc.companyCtrl,
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
                                  ],
                                ),
                              ),
                              // const Spacer(),
                              state is AuthLoadingState
                                  ? const ButtonIncdicator()
                                  : SButton(
                                      title: 'إنشاء حساب',
                                      onTap: () {
                                        if (!bloc.formKey.currentState!
                                            .validate()) {
                                          return;
                                        }
                                        if (bloc.profileImage == null) {
                                          showBar('اضف صورة شخصية', context);
                                          return;
                                        }
                                        bloc.add(ManagerSignUpEvent());
                                      }),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SText(
                                    'لديك حساب بالفعل؟ ',
                                    color: Colors.white,
                                    fontSize: 12.r,
                                  ),
                                  InkWell(
                                    onTap: () => NV.nextScreenReplaceNamed(
                                        context, SignInScreen.routeName,
                                        args: false),
                                    child: SText(
                                      'تسجيل الدخول',
                                      color: theme.primaryColor,
                                      fontSize: 12.r,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).viewInsets.bottom /
                                          4)
                            ],
                          ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
