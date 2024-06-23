import 'package:flutter/material.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/core.dart';

class AuthRedirectWidget extends StatelessWidget {
  const AuthRedirectWidget({
    super.key,
    required this.mainText,
    required this.buttonLabel,
    required this.onTap,
  });

  final String mainText;
  final String buttonLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TBText(
          mainText,
          style: TBTextStyle.label,
          color: colors.onSurface,
        ),
        TBScreenUtil.hSpace(4),
        InkWell(
          onTap: onTap,
          child: TBText(
            buttonLabel,
            color: colors.onSurface,
            style: TBTextStyle.label.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
