import 'package:flutter/material.dart';

extension ImagePath on String {
  String get toPng => 'assets/images/$this.png';
  String get toSvg => 'assets/images/$this.svg';
  String get toJpg => 'assets/images/$this.jpg';
  String get toGif => 'assets/images/$this.gif';
}

extension ValidImageUrl on String? {
  String get toValidImageUrl {
    if (this == null || this!.trim().isEmpty) return '';
    String url = this!.trim();
    if (url.contains('hr.gomltak.com')) {
      url = url.replaceAll('hr.gomltak.com', 'hr.emenu.club');
    }
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      if (url.startsWith('/')) {
        url = 'https://hr.emenu.club$url';
      } else {
        url = 'https://hr.emenu.club/$url';
      }
    }
    return url;
  }
}

extension Emptypadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

extension FormattedRadius on num? {
  String get formatRadius {
    if (this == null) return '';
    final d = this!.toDouble();
    final fixed = double.parse(d.toStringAsFixed(2));
    if (fixed % 1 == 0) {
      return fixed.toInt().toString();
    }
    String str = fixed.toStringAsFixed(2);
    if (str.contains('.')) {
      str = str.replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
    }
    return str;
  }
}

extension ThemeShortCuts on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  // ElevatedButtonThemeData get elevatedButtonTheme =>
  //     Theme.of(this).elevatedButtonTheme;
  // TextStyle? get headLinesmail => Theme.of(this).textTheme.headlineSmall;
  // Color? get prinmaryColor => Theme.of(this).primaryColor.;
}

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get topPading => MediaQuery.of(this).padding.top;
}

//GoRouter.of(context).push('/openBookView');

