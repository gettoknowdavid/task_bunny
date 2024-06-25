import 'package:flutter/material.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/core.dart';

final class TBTheme {
  static ThemeData get dark => _createTheme(Brightness.dark);

  static ThemeData get light => _createTheme(Brightness.light);

  TBTheme._();

  static ColorScheme _getColorScheme(bool isLight) {
    return isLight ? const ColorScheme.light() : const ColorScheme.dark();
  }

  static ColorScheme _colorScheme(Brightness brightness, bool isLight) {
    return _getColorScheme(isLight).copyWith(
      brightness: brightness,
      primary: TBColors.green,
      onPrimary: TBInternal.r(isLight, TBColors.grey50, TBColors.black),
      secondary: TBColors.yellow,
      onSecondary: TBColors.black,
      surface: TBInternal.r(isLight, TBColors.grey50, TBColors.grey900),
      onSurface: TBInternal.r(isLight, TBColors.black, TBColors.white),
    );
  }

  static ThemeData _createTheme(Brightness brightness) => _raw(brightness);

  static ThemeData _raw(Brightness brightness) {
    final isLight = brightness == Brightness.light;
    final colors = _colorScheme(brightness, isLight);

    final appSide = TBInternal.all(BorderSide(
      color: colors.onSurface,
      width: TBScreenUtil.w(2),
    ));

    final appShape = TBInternal.all(TBBorderRadius.squircleBorder(radius: 8));

    return ThemeData(
      colorScheme: colors,
      fontFamily: FontFamily.inter,
      appBarTheme: AppBarTheme(
        foregroundColor: colors.onSurface,
        backgroundColor: TBInternal.r(isLight, TBColors.grey50, TBColors.black),
        shape: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: colors.onSurface),
        ),
        titleTextStyle: TBTextStyle.heading2Bold.copyWith(
          color: colors.onSurface,
        ),
      ),
      dividerTheme: DividerThemeData(color: colors.onSurface.withOpacity(0.5)),
      dialogTheme: DialogTheme(
        titleTextStyle: TBTextStyle.heading3Bold,
        contentTextStyle: TBTextStyle.captionBold,
        alignment: Alignment.center,
        shape: TBBorderRadius.squircleBorder(
          side: BorderSide(
            color: colors.onSurface,
            width: TBScreenUtil.w(2),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          iconSize: TBInternal.all(18),
          textStyle: TBInternal.all(TBTextStyle.label),
          foregroundColor: TBInternal.all(colors.onSurface),
          side: appSide,
          shape: appShape,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          iconSize: TBInternal.all(18),
          textStyle: TBInternal.all(TBTextStyle.label),
          foregroundColor: TBInternal.all(colors.onPrimary),
          side: appSide,
          shape: appShape,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          iconSize: TBInternal.all(18),
          textStyle: TBInternal.all(TBTextStyle.label),
          padding: TBInternal.all(TBEdgeInsets.symmetric(h: 12)),
          foregroundColor: TBInternal.all(colors.onSurface),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(),
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: TBTextStyle.captionBold,
        insetPadding: TBEdgeInsets.fromLTRB(16, 0, 16, 24),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colors.onSurface, width: TBScreenUtil.w(2)),
          borderRadius: TBBorderRadius.squircle(radius: 8),
        ),
      ),
    );
  }
}
