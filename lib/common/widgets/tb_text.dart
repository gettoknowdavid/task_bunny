import 'package:flutter/material.dart';

class TBText extends Text {
  const TBText(
    super.data, {
    super.key,
    super.style,
    super.textAlign,
    super.maxLines,
    super.overflow,
    this.color,
  }) : _data = data;

  final String _data;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Text(
      _data,
      style: style?.copyWith(color: color ?? colors.onSurface),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
