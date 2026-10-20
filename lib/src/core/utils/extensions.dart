import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
export 'context_extensions.dart';

extension ImagePath on String {
  String get toPng => 'assets/images/$this.png';
  String get toSvg => 'assets/images/$this.svg';
  String get toJpg => 'assets/images/$this.jpg';
  String get toGif => 'assets/images/$this.gif';
}

extension ValidImageUrl on String? {
  String get toValidImageUrl {
    if (this == null || this!.trim().isEmpty) return '';
    var url = this!.trim();
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

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: h);
  SizedBox get pw => SizedBox(width: w);
}

extension FormattedRadius on num? {
  String get formatRadius {
    if (this == null) return '';
    final d = this!.toDouble();
    final fixed = double.parse(d.toStringAsFixed(2));
    if (fixed % 1 == 0) {
      return fixed.toInt().toString();
    }
    var str = fixed.toStringAsFixed(2);
    if (str.contains('.')) {
      str = str.replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
    }
    return str;
  }
}
