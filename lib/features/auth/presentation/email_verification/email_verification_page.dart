import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/common/widgets/tb_extensions.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/application/application.dart';
import 'package:task_bunny/utils/utils.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final bloc = context.read<EmailVerificationCubit>();
    return BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        state.whenOrNull(
          verificationCancelled: () => const SignInRoute().go(context),
          verificationInProgress: () => context.showTBLoadingDialog(),
          verificationFailure: (exception) => context.showTBSnackBar(
            exception.maybeWhen(
              orElse: () => TBStrings.unknownError,
              message: (message) => message,
            ),
          ),
          verificationMailSent: () {
            Navigator.pop(context);
            context.showTBSnackBar(
              'Verification mail sent! Check you inbox or spam.',
              isError: false,
            );
          },
        );
      },
      builder: (context, state) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: TBEdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              TBScreenUtil.vSpace(30),
              PhosphorIcon(
                PhosphorIconsDuotone.shieldCheck,
                size: TBScreenUtil.r(100),
              ),
              TBScreenUtil.vSpace(18),
              const TBText(
                'Let\'s get you verified',
                style: TBTextStyle.heading2Bold,
                textAlign: TextAlign.center,
              ),
              TBScreenUtil.vSpace(6),
              TBText(
                'We have sent an email to prdmike@gmail.com. Please verify your TaskBunny account to continue using it. This is to help keep your account safe.',
                style: TBTextStyle.captionBold,
                textAlign: TextAlign.center,
                color: colors.onSurface.opaque(0.6),
              ),
              const Spacer(),
              TBPrimaryButton(
                label: 'Check Verification',
                onTap: bloc.checkEmailVerified,
              ),
              TBScreenUtil.vSpace(16),
              TBPrimaryButton(
                label: 'Open your email app',
                onTap: () => bloc.openMailApp(context),
              ),
              TBScreenUtil.vSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TBTextButton(onTap: bloc.cancel, label: 'Cancel'),
                  TBTextButton(
                    onTap: bloc.sendVerificationEmail,
                    label: 'Resend',
                  ),
                ],
              ),
              TBScreenUtil.vSpace(30),
            ],
          ),
        ),
      ),
    );
  }
}
