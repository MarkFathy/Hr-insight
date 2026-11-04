import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/app/di/service_locator.dart';
import 'package:hr_app/app/router/routing_page.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/app_back_button.dart';
import 'package:hr_app/core/shared/widgets/app_button.dart';
import 'package:hr_app/core/shared/widgets/app_snack_bar.dart';
import 'package:hr_app/core/shared/widgets/app_text_field.dart';
import 'package:hr_app/core/shared/widgets/button_indicator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_register_params.dart';
import 'package:hr_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:hr_app/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:hr_app/features/authentication/presentation/widgets/manager_avatar_picker.dart';
import 'package:hr_app/features/authentication/presentation/widgets/manager_otp_verification_view.dart';

class ManagerSignUpPage extends StatefulWidget {
  static const routeName = '/manager-signup';
  const ManagerSignUpPage({super.key});

  @override
  State<ManagerSignUpPage> createState() => _ManagerSignUpPageState();
}

typedef ManagerSignUpScreen = ManagerSignUpPage;

class _ManagerSignUpPageState extends State<ManagerSignUpPage>
    with AutoConnectivityRestoreMixin {
  late final AuthBloc _bloc;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _bloc = sl<AuthBloc>();
  }

  @override
  void onConnectivityRestored() {}

  @override
  void dispose() {
    unawaited(_bloc.close());
    super.dispose();
  }

  void _handleSignUp(AuthBloc bloc) {
    if (!bloc.formKey.currentState!.validate()) {
      return;
    }
    final image = _selectedImage ?? bloc.profileImage;
    if (image == null) {
      showBar('اضف صورة شخصية', context);
      return;
    }
    bloc.profileImage = image;
    bloc.add(
      ManagerSignUpEvent(
        params: ManagerRegisterParams(
          name: bloc.nameCtrl.text,
          email: bloc.emailCtrl.text,
          password: bloc.passwordCtrl.text,
          passwordConfirmation: bloc.confirmPasswordCtrl.text,
          companyName: bloc.companyCtrl.text,
          phone: bloc.phoneCtrl.text,
          image: image,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    body: BlocProvider.value(
      value: _bloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailureState) {
            showBar(state.error, context);
          }
          if (state is AuthSuccessState) {
            NavigationHelper.nextScreenCloseOthersNamed(
              context,
              RoutingPage.routeName,
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
              body: ResponsiveContainer(
                maxWidth: 520,
                child: Form(
                  key: bloc.formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: BlocSelector<AuthBloc, AuthState, EmailVerifiedState?>(
                        selector: (state) =>
                            state is EmailVerifiedState ? state : null,
                        builder: (context, verifiedState) {
                          if (verifiedState != null) {
                            final email =
                                verifiedState.manager?.data?.manager?.email ??
                                bloc.emailCtrl.text;
                            return ManagerOtpVerificationView(email: email);
                          }

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                child: Column(
                                  children: [
                                    ManagerAvatarPicker(
                                      image:
                                          _selectedImage ?? bloc.profileImage,
                                      onImagePicked: (img) {
                                        setState(() {
                                          _selectedImage = img;
                                          bloc.profileImage = img;
                                        });
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
                                        onTap: () => _handleSignUp(bloc),
                                      ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'لديك حساب بالفعل؟ ',
                                    style: context.typography.bodySmall
                                        .copyWith(
                                          color: context.colors.textPrimary,
                                          fontSize: 12,
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
                                      style: context.typography.bodySmall
                                          .copyWith(
                                            color: context.colors.primary,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.viewInsetsOf(context).bottom / 4,
                              ),
                            ],
                          );
                        },
                      ),
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
