import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/utils/extensions.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String? hintText;
  final bool optional;
  final bool isMobile;
  final bool isEmail;
  final bool isPassword;
  final bool isMultiLine;
  final bool enabled;
  final TextInputType? type;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChange;
  final Color? textColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? padding;

  const AppTextField({
    super.key,
    this.validator,
    this.optional = false,
    this.controller,
    this.isMultiLine = false,
    this.isEmail = false,
    this.isMobile = false,
    this.isPassword = false,
    this.enabled = true,
    this.onChange,
    this.textColor,
    TextInputType? type,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.padding,
    this.hintText,
    TextInputType? keyboardType,
    String? lable,
    String? label,
  }) : type = keyboardType ?? type ?? TextInputType.text,
       label = label ?? lable ?? '';

  String get lable => label;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    Widget? effectiveSuffixIcon;

    if (widget.isPassword) {
      effectiveSuffixIcon = IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: Colors.white70,
          size: 20.r,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    } else if (widget.suffixIcon != null) {
      effectiveSuffixIcon = widget.suffixIcon;
    }

    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(vertical: 8.h),
      child: TextFormField(
        controller: widget.controller,
        autocorrect: false,
        enabled: widget.enabled,
        keyboardType: widget.type,
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChange,
        maxLines: widget.isMultiLine ? 3 : 1,
        obscureText: widget.isPassword && _obscureText,
        style: context.typography.body.copyWith(
          color: widget.textColor ?? Colors.white,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          labelText: widget.label.isNotEmpty ? widget.label : null,
          hintText: widget.hintText ?? widget.label,
          prefixIcon: widget.prefixIcon,
          suffixIcon: effectiveSuffixIcon,
        ),
        validator: widget.optional
            ? null
            : (widget.validator ??
                  (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'هذا الحقل مطلوب';
                    }
                    if (widget.isEmail &&
                        (!value.contains('@') || !value.contains('.'))) {
                      return 'ادخل بريد إلكتروني صالح';
                    }
                    if (widget.isMobile && value.length < 11) {
                      return 'أدخل رقم هاتف صحيح';
                    }
                    if (widget.isPassword && value.length < 6) {
                      return 'كلمة المرور لا تقل عن 6 أحرف';
                    }
                    return null;
                  }),
      ),
    );
  }
}

/// Backwards compatibility alias
typedef STextField = AppTextField;
