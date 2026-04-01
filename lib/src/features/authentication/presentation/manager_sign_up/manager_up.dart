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
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/authentication/presentation/sign_in/sign_in.dart';
import 'package:hr_app/src/injector.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<File> pickImage() async {
    return File(await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((value) => value!.path));
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
                                      return Padding(
                                        padding: EdgeInsets.all(10.r),
                                        child: InkWell(
                                          onTap: () async {
                                            context
                                                    .read<AuthBloc>()
                                                    .profileImage =
                                                await pickImage();
                                            changeState(() {});
                                          },
                                          child: Material(
                                            color: Colors.grey.shade200,
                                            shape: const CircleBorder(),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.r),
                                              child: context
                                                          .read<AuthBloc>()
                                                          .profileImage !=
                                                      null
                                                  ? Image.file(
                                                      context
                                                          .read<AuthBloc>()
                                                          .profileImage!,
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
                                          showBar('اضف صوؤة شخصية', context);
                                          return;
                                        }
                                        bloc.add(ManagerSignUpEvent());
                                      }),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SText(
                                    'لديك حساب بالفعل؟ ',
                                    fontSize: 11.r,
                                  ),
                                  InkWell(
                                    onTap: () => NV.nextScreenReplaceNamed(
                                        context, SignInScreen.routeName,
                                        args: false),
                                    child: SText(
                                      'تسجيل دخول',
                                      color: theme.primaryColor,
                                      fontSize: 11.r,
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
