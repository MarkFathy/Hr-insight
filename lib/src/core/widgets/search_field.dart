import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extensions.dart';

class SearchField extends StatefulWidget {
  final ValueChanged<String?> onChanged;
  final String hint;
  final TextEditingController? controller;
  final VoidCallback? onClear;

  const SearchField({
    required this.onChanged,
    super.key,
    String hint = 'بحث...',
    this.controller,
    this.onClear,
    String? hintText,
  }) : hint = hintText ?? hint;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_handleTextChanged);
  }

  void _handleTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_handleTextChanged);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: TextField(
            controller: _controller,
            onChanged: widget.onChanged,
            style: context.typography.body.copyWith(color: Colors.white),
            decoration: InputDecoration(
              isDense: true,
              filled: false,
              hintText: widget.hint,
              hintStyle: context.typography.bodySmall.copyWith(
                color: Colors.white.withValues(alpha: 0.45),
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: context.colors.primary,
                size: 22.r,
              ),
              suffixIcon: _hasText
                  ? IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        size: 18.r,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        _controller.clear();
                        widget.onChanged('');
                        widget.onClear?.call();
                      },
                    )
                  : null,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
            ),
          ),
        ),
      );
}
