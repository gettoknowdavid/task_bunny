import 'package:flutter/material.dart';
import 'package:task_bunny/common/common.dart';

import 'tb_colors.dart';
import 'tb_internal.dart';

final class TBTheme {
  static ThemeData get dark => _createTheme(Brightness.dark);

  static ThemeData get light => _createTheme(Brightness.light);

  TBTheme._();

  static ColorScheme _colorScheme(Brightness brightness, bool isLight) {
    return ColorScheme(
      brightness: brightness,
      primary: TBColors.green,
      onPrimary: TBColors.white,
      secondary: TBColors.yellow,
      onSecondary: TBColors.black,
      error: TBColors.red,
      onError: TBColors.white,
      surface: TBInternal.r(isLight, TBColors.grey50, TBColors.grey900),
      onSurface: TBInternal.r(isLight, TBColors.black, TBColors.white),
    );
  }

  static ThemeData _createTheme(Brightness brightness) => _raw(brightness);

  static ThemeData _raw(Brightness brightness) {
    final isLight = brightness == Brightness.light;
    final colorScheme = _colorScheme(brightness, isLight);

    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: FontFamily.inter,
    );
  }
}
