import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class TBBorderRadius {
  TBBorderRadius._();

  static BorderRadius all(double value) {
    return BorderRadius.all(Radius.circular(value)).r;
  }

  static BorderRadius v({double top = 0, double bottom = 0}) {
    return BorderRadius.vertical(
      top: Radius.circular(top),
      bottom: Radius.circular(bottom),
    ).r;
  }

  static BorderRadius h({double left = 0, double right = 0}) {
    return BorderRadius.horizontal(
      left: Radius.circular(left),
      right: Radius.circular(right),
    ).r;
  }

  static SmoothBorderRadius squircle(
      {double radius = 12, double smoothing = 1.0}) {
    return SmoothBorderRadius(cornerRadius: radius, cornerSmoothing: smoothing);
  }

  static OutlinedBorder squircleBorder({
    double radius = 12,
    double smoothing = 1.2,
    BorderSide? side,
  }) {
    return SmoothRectangleBorder(
      borderRadius: SmoothBorderRadius(
        cornerRadius: radius,
        cornerSmoothing: smoothing,
      ),
      side: side ?? BorderSide.none,
    );
  }
}

final class TBEdgeInsets {
  TBEdgeInsets._();

  static EdgeInsets all(double value) => EdgeInsets.all(value).r;

  static EdgeInsets fromLTRB(double l, double t, double r, double b) {
    return EdgeInsets.fromLTRB(l, t, r, b).r;
  }

  static EdgeInsets only({
    double l = 0.0,
    double t = 0.0,
    double r = 0.0,
    double b = 0.0,
  }) {
    return EdgeInsets.only(left: l, top: t, right: r, bottom: r).r;
  }

  static EdgeInsets symmetric({double h = 0.0, double v = 0.0}) {
    return EdgeInsets.symmetric(horizontal: h, vertical: v).r;
  }
}

final class TBConstraints {
  TBConstraints._();

  static BoxConstraints value({
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) {
    return BoxConstraints(
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      minHeight: minHeight,
      minWidth: minWidth,
    ).r;
  }
}

final class TBScreenUtil {
  TBScreenUtil._();

  static double h(double value) => value.h;

  /// Creates a [SizedBox] with a [width] as the value provided.
  static SizedBox hSpace(double value) => value.horizontalSpace;

  static double r(double value) => value.r;

  static double sp(double value) => value.sp;

  /// Creates a [SizedBox] with a [height] as the value provided.
  static SizedBox vSpace(double value) => value.verticalSpace;

  static double w(double value) => value.w;

  static double sh([double value = 1]) => value.sh;

  static double sw([double value = 1]) => value.sw;
}
