import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:task_bunny/common/common.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TBSecondaryButton.icon(
      onTap: () {},
      label: 'Login with Google',
      icon: PhosphorIconsBold.googleLogo,
    );
  }
}
