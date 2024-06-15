import 'package:flutter/material.dart';

final class TBColors {
  static const Color red = Color(0xFFFF7990);
  static const Color blue = Color(0xFF5F9BB9);
  static const Color green = Color(0xFF7EBA94);
  static const Color yellow = Color(0xFFFEDC99);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey50 = Color(0xFFFBFBFB);
  static const Color black = Color(0xFF000000);
  static const Color grey900 = Color(0xFF333333);
  TBColors._();
}

extension ColorX on Color {
  Color get opaque => withOpacity(0.3);
}
