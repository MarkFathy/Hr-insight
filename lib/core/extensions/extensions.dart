import 'package:flutter/material.dart';

export 'package:hr_app/core/utils/responsive.dart';
export 'context_extensions.dart';

extension ImagePath on String {
  String get toPng => 'assets/images/$this.png';
  String get toGif => 'assets/images/$this.gif';
}

extension ValidImageUrl on String? {
  String get toValidImageUrl {
    final self = this?.trim();
    if (self == null || self.isEmpty) return '';
    var url = self.contains('hr.gomltak.com')
        ? self.replaceAll('hr.gomltak.com', 'hr.emenu.club')
        : self;
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      url = url.startsWith('/')
          ? 'https://hr.emenu.club$url'
          : 'https://hr.emenu.club/$url';
    }
    return url;
  }
}

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

extension FormattedRadius on num? {
  String get formatRadius {
    if (this case final num val) {
      final fixed = double.parse(val.toDouble().toStringAsFixed(2));
      if (fixed % 1 == 0) {
        return fixed.toInt().toString();
      }
      var str = fixed.toStringAsFixed(2);
      if (str.contains('.')) {
        str = str.replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
      }
      return str;
    }
    return '';
  }
}
