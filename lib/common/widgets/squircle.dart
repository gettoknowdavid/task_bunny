import 'package:flutter/material.dart';
import 'package:task_bunny/core/core.dart';

class Squircle extends StatelessWidget {
  const Squircle({
    super.key,
    this.radius = 12.0,
    this.smoothing = 1.0,
    this.child,
    this.borderColor,
    this.borderWidth = 1.5,
    this.height,
    this.width,
    this.padding,
  });

  final Widget? child;
  final Color? borderColor;
  final double borderWidth;
  final double radius;
  final double smoothing;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final getBorderColor = borderColor ?? colors.onSurface;
    return Container(
      padding: padding,
      height: height,
      width: width,
      decoration: ShapeDecoration(
        shape: TBBorderRadius.squircleBorder(
          radius: radius,
          smoothing: smoothing,
          side: BorderSide(color: getBorderColor, width: borderWidth),
        ),
      ),
      child: child,
    );
  }
}
