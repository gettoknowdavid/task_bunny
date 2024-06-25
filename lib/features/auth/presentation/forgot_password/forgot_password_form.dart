import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:task_bunny/common/widgets/widgets.dart';
import 'package:task_bunny/core/core.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TBAuthTextFormField(
          label: 'Email Address',
          icon: PhosphorIconsBold.at,
          hintText: 'Your registered email address',
        ),
        TBScreenUtil.vSpace(50),
        TBPrimaryButton(
          label: 'Submit',
          onTap: () {},
        ),
      ],
    );
  }
}
