import 'package:flutter/material.dart';

/// Centralized responsive breakpoints based on native Flutter standards.
///
/// Guidelines:
/// - Compact phone: width below 360 logical pixels.
/// - Standard phone: width from 360 to below 600.
/// - Tablet: width from 600 to below 840.
/// - Expanded layout: width of 840 and above.
class AppBreakpoints {
  const AppBreakpoints._();

  static const double compact = 360.0;
  static const double standardPhone = 600.0;
  static const double tablet = 840.0;
  static const double expanded = 1200.0;
  static const double maxContentWidth = 640.0;

  static bool isCompact(BuildContext context) =>
      MediaQuery.sizeOf(context).width < compact;

  static bool isStandardPhone(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= compact && width < standardPhone;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= standardPhone && width < tablet;
  }

  static bool isExpanded(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tablet;

  /// Returns an adaptive integer column count given the maximum width constraint.
  static int gridColumnsForWidth(
    double width, {
    int compactColumns = 1,
    int phoneColumns = 2,
    int tabletColumns = 3,
    int expandedColumns = 4,
  }) {
    if (width < compact) return compactColumns;
    if (width < standardPhone) return phoneColumns;
    if (width < tablet) return tabletColumns;
    return expandedColumns;
  }
}

/// A lightweight container that prevents content from stretching excessively
/// on tablets, foldables, and desktop layouts by applying a maximum width constraint.
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry? padding;

  const ResponsiveContainer({
    required this.child,
    super.key,
    this.maxWidth = 640.0,
    this.alignment = Alignment.topCenter,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final content = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: child,
    );

    return Align(
      alignment: alignment,
      child: padding != null
          ? Padding(padding: padding!, child: content)
          : content,
    );
  }
}
