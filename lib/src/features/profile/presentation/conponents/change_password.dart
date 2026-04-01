import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/shared_widgets/app_indicator.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';
import 'package:hr_app/src/core/shared_widgets/s_text_field.dart';
import 'package:hr_app/src/core/shared_widgets/snake_bar.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/injector.dart';

class ChangePasswordSheet extends StatelessWidget {
  const ChangePasswordSheet({super.key, required this.isEmployee});
  final bool isEmployee;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: MyColors.greyColor,
      onClosing: () {},
      builder: (context) => BlocProvider(
        create: (context) => sl<AuthBloc>()..add(AutoLoginEvent()),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is PasswordChangedState) {
              showBar('تم تغيير كلمة المرور', context);
              NV.pop(context);
            }
          },
          builder: (context, state) {
            final bloc = context.read<AuthBloc>();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Form(
                key: bloc.formKey,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  10.ph,
                  const SText(
                    'تغيير كلمة المرور',
                  ),
                  7.ph,
                  const Divider(),
                  if (state is AuthFailureState)
                    Text(
                      state.error,
                      style: const TextStyle(color: Colors.red),
                    ),
                  STextField(
                    lable: 'كلمة المرور الحالية',
                    controller: bloc.oldPassword,
                    isPassword: true,

                  ),
                  STextField(
                    lable: 'كلمة المرور الجديدة',
                    controller: bloc.passwordCtrl,
                    isPassword: true,
                  ),
                  STextField(
                    lable: 'تأكيد كلمة المرور',
                    controller: bloc.confirmPasswordCtrl,
                    isPassword: true,
                  ),
                  state is AuthLoadingState
                      ? const AppIndicator(
                          size: 60,
                        )
                      : SButton(
                          title: 'تم',
                          onTap: () {
                            if (!bloc.formKey.currentState!.validate()) return;
                            bloc.add(
                                ChangePasswordEvent(isEmployee: isEmployee));
                          }),
                  SizedBox(
                    height: MediaQuery.viewInsetsOf(context).bottom,
                  )
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
