import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/consts/app_images.dart';
import 'package:hr_app/src/core/public_models/token.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/profile/presentation/conponents/change_password.dart';
import 'package:hr_app/src/features/profile/presentation/conponents/more_card.dart';
import 'package:hr_app/src/features/profile/presentation/conponents/user_card.dart';

class ProfileScreen extends StatelessWidget {
  final bool isEmployee;
  const ProfileScreen({super.key, required this.isEmployee});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    context.read<AuthBloc>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UserCard(isEmployee: isEmployee),
            if (isEmployee)
              MoreCard(
                title: 'تغيير كلمة المرور',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    builder: (context) =>
                        ChangePasswordSheet(isEmployee: isEmployee),
                  );
                },
              ),
            MoreCard(
              title: 'حذف الحساب',
              onTap: () {
                // عرض حوار التأكيد قبل حذف الحساب
                showDialog(
                  context: context,
                  builder: (context) {
                    final passwordController = TextEditingController();

                    return AlertDialog(
                      title: const Text('تأكيد حذف الحساب'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                              'يرجى إدخال كلمة المرور لتأكيد حذف الحساب:'),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'كلمة المرور',
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('إلغاء'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final password = passwordController.text;
                            if (password.isNotEmpty) {
                              await deleteAccount(password, context);
                            }
                            Navigator.of(context).pop();

                            NV.nextScreenNamed(context, "/intro");
                          },
                          child: const Text('حذف'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: (size.height * .1).r),
                child: Image.asset(AppImages.logo),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteAccount(String password, BuildContext context) async {
    final Dio dio = Dio();
    final token = Token().getToken;

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await dio.delete(
        'https://hr.gomltak.com/api/v1/employee/deleteAccount',
        options: Options(
          headers: headers,
          contentType: Headers.formUrlEncodedContentType,
        ),
        data: {
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
      } else {
        if (kDebugMode) {
          print(response.statusMessage);
        }
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error: ${e.message}');
      }
    }
  }
}
