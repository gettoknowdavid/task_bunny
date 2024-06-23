import 'package:flutter/material.dart';
import 'package:task_bunny/core/core.dart';

import 'tb_text.dart';

class TBTextButton extends StatelessWidget {
  const TBTextButton({
    super.key,
    required this.label,
    this.onTap,
    this.style = TBTextStyle.textLabel,
    this.color,
  });

  final String label;
  final VoidCallback? onTap;
  final TextStyle style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TBText(label, style: style, color: color),
    );
  }
}
