import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/application/application.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: TBEdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TBScreenUtil.vSpace(30),
            const Spacer(),
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
              label: 'Open your email app',
              onTap: () {},
            ),
            TBScreenUtil.vSpace(30),
            Center(
              child: TBTextButton(
                onTap: context.read<AuthCubit>().signOut,
                label: 'Cancel',
              ),
            ),
            TBScreenUtil.vSpace(30),
          ],
        ),
      ),
    );
  }
}
