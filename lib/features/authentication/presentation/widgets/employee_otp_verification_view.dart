import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/app_button.dart';
import 'package:hr_app/core/shared/widgets/app_indicator.dart';
import 'package:hr_app/core/shared/widgets/app_text_field.dart';
import 'package:hr_app/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/features/authentication/presentation/bloc/auth_bloc.dart';

class EmployeeOtpVerificationView extends StatelessWidget {
  final String email;

  const EmployeeOtpVerificationView({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return Column(
      children: [
        20.ph,
        Text(
          'تم إرسال رمز التحقق الى : $email',
          style: context.typography.body.copyWith(
            color: context.colors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        20.ph,
        AppTextField(
          label: 'رمز التحقق',
          controller: bloc.verificationCode,
          type: TextInputType.number,
        ),
        BlocSelector<AuthBloc, AuthState, bool>(
          selector: (state) => state is AuthLoadingState,
          builder: (context, isLoading) => isLoading
              ? const AppIndicator()
              : AppButton(
                  title: 'تأكيد',
                  onTap: () {
                    if (!bloc.formKey.currentState!.validate()) {
                      return;
                    }
                    bloc.add(
                      VerifyEmailEvent(
                        VerifyParams(
                          email: email,
                          otp: bloc.verificationCode.text,
                          isEmployee: true,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
