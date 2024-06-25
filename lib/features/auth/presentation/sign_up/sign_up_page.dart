import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/application/application.dart';
import 'package:task_bunny/utils/utils.dart';

import '../widgets/widgets.dart';
import 'sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocListener<SignUpFormCubit, SignUpFormState>(
      listenWhen: (p, c) => p.option != c.option,
      listener: (context, state) {
        state.option.fold(
          () => null,
          (either) => either.fold(
            (exception) => context.showTBSnackBar(exception.maybeWhen(
              orElse: () => TBStrings.unknownError,
              message: (message) => message,
            )),
            (_) {
              context.read<EmailVerificationCubit>().sendVerificationEmail();
            },
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TBText('Sign Up'),
          toolbarHeight: TBScreenUtil.h(100),
        ),
        body: SingleChildScrollView(
          padding: TBEdgeInsets.symmetric(h: Insets.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TBScreenUtil.vSpace(20),
              TBText(
                'Create a new account with your credentials or with Google sign in.',
                style: TBTextStyle.captionBold,
                color: colors.onSurface.opaque(0.8),
              ),
              TBScreenUtil.vSpace(24),
              const SignUpForm(),
              TBScreenUtil.vSpace(16),
              AuthRedirectWidget(
                mainText: 'Already got an account?',
                buttonLabel: 'Sign In now',
                onTap: () => Navigator.pop(context),
              ),
              TBScreenUtil.vSpace(30),
            ],
          ),
        ),
      ),
    );
  }
}
