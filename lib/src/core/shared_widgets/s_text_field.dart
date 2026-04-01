import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/google_fonts.dart';

class STextField extends StatelessWidget {
  final TextEditingController? controller;
  final String lable;
  final bool optional;
  final bool isMobile;
  final bool isEmail;
  final bool isPassword;
  final bool isMultiLine;
  final bool enabled;
  final TextInputType? type;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChange;

  const STextField(
      {super.key,
      this.validator,
      this.optional = false,
      this.controller,
      this.isMultiLine = false,
      this.isEmail = false,
      this.isMobile = false,
      this.isPassword = false,
      this.enabled = true,
      this.onChange,
      this.type = TextInputType.text,
      required this.lable});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool obsecure = true;

    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: theme.primaryColor));
    return StatefulBuilder(builder: (context, changeState) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.r),
        child: TextFormField(

            controller: controller,
            autocorrect: false,
            enabled: enabled,
            // keyboardType: type,
            expands: false,
            onChanged: onChange,
            maxLines: isMultiLine ? 3 : 1,
            obscureText: isPassword && obsecure,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                hintText: lable,
                hintStyle:  const TextStyle(color: Colors.white),
                labelStyle: const TextStyle(color: Colors.white),

                border: border,
                suffixIcon: isPassword
                    ? InkWell(
                        onTap: () => changeState(() => obsecure = !obsecure),
                        child: obsecure
                            ? const Icon(Icons.remove_red_eye,color: Colors.white,)
                            : const Icon(Icons.remove_red_eye_outlined,color: Colors.white,),
                      )
                    : null,
                enabledBorder: border),
            style: safeGoogleFont('Cairo',
                fontWeight: FontWeight.w800, fontSize: 12.r,
              color: Colors.white

            ),
            validator: optional
                ? null
                : (validator ??
                    (value) {
                      if (value!.isEmpty) return 'مطلوب';
                      if (isEmail &&
                          (!value.contains('@') || !value.contains('.com'))) {
                        return 'ادخل بريد صالح';
                      }
                      if (isMobile && value.length < 11) {
                        return 'أدخل رقم هاتف صحيح';
                      }
                      if (isPassword && value.length < 6) {
                        return 'كلمة المرور لايمكن ان تكون اقل من 6';
                      }
                      return null;
                    })),
      );
    });
  }
}
