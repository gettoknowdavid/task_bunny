import 'package:flutter/material.dart';
import 'package:task_bunny/common/common.dart';

final class TBTextStyle extends TextStyle {
  static const String _fontFamily = FontFamily.inter;

  static const display = TBTextStyle._(
    fontSize: 26.0,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: -1,
    height: 1.2,
  );

  static const heading1Light = TBTextStyle._(
    fontSize: 24.0,
    fontWeight: FontWeight.w200,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const heading1Medium = TBTextStyle._(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const heading1Bold = TBTextStyle._(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const heading2Light = TBTextStyle._(
    fontSize: 20.0,
    fontWeight: FontWeight.w200,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const heading2Medium = TBTextStyle._(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const heading2Bold = TBTextStyle._(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const heading3Bold = TBTextStyle._(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
    height: 1,
  );

  static const bodyLight = TBTextStyle._(
    fontSize: 14.0,
    fontWeight: FontWeight.w200,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const bodyRegular = TBTextStyle._(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const bodyBold = TBTextStyle._(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );


  static const caption = TBTextStyle._(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: -0.5,
  );

  static const captionBold = TBTextStyle._(
    fontSize: 13.0,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const label = TBTextStyle._(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const textLabel = TBTextStyle._(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
    decoration: TextDecoration.underline,
  );

  static const error = TBTextStyle._(
    fontSize: 11.0,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: -0.5,
  );

  const TBTextStyle._({
    super.fontSize,
    super.fontWeight,
    super.fontFamily,
    super.textBaseline,
    super.letterSpacing,
    super.height,
    super.decoration,
  });
}
