import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:task_bunny/common/widgets/widgets.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/features.dart';

class CheckYourMailPage extends StatelessWidget {
  const CheckYourMailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
        padding: TBEdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TBText(
                'You have mail',
                style: TBTextStyle.heading1Bold,
                textAlign: TextAlign.center,
              ),
              TBScreenUtil.vSpace(30),
              PhosphorIcon(
                PhosphorIconsDuotone.mailbox,
                color: colors.primary,
                size: TBScreenUtil.r(200),
              ),
              TBScreenUtil.vSpace(30),
              TBText(
                'We have just sent an email to your inbox with a link to reset your password. If you cannot find it in your inbox, please check your spam folder.',
                style: TBTextStyle.captionBold,
                textAlign: TextAlign.center,
                color: colors.onSurface.opaque(0.5),
              ),
              TBScreenUtil.vSpace(40),
              TBPrimaryButton.icon(
                label: 'Back to Sign In',
                onTap: () => const SignInRoute().go(context),
                icon: PhosphorIconsBold.arrowLeft,
              ),
              TBScreenUtil.vSpace(20),
              TBSecondaryButton(
                label: 'Open Mail App',
                onTap: () => context
                    .read<ForgotPasswordFormCubit>()
                    .openMailApp(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
