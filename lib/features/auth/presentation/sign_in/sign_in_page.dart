import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/application/application.dart';
import 'package:task_bunny/utils/utils.dart';

import '../widgets/widgets.dart';
import 'sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocListener<SignInFormCubit, SignInFormState>(
      listenWhen: (p, c) => p.option != c.option,
      listener: (context, state) {
        state.option.fold(
          () => null,
          (either) => either.fold(
            (exception) => context.showErrorSnackBar(exception.maybeWhen(
              orElse: () => TBStrings.unknownError,
              message: (message) => message,
            )),
            (_) => null,
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TBText('Sign In'),
          toolbarHeight: TBScreenUtil.h(100),
        ),
        body: SingleChildScrollView(
          padding: TBEdgeInsets.symmetric(h: Insets.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TBScreenUtil.vSpace(20),
              TBText(
                'Continue with Google or you can sign in with your email and password.',
                style: TBTextStyle.captionBold,
                color: colors.onSurface.opaque(0.8),
              ),
              TBScreenUtil.vSpace(16),
              const GoogleSignInButton(),
              TBScreenUtil.vSpace(24),
              const OrDividerWidget(),
              TBScreenUtil.vSpace(24),
              const SignInForm(),
              TBScreenUtil.vSpace(24),
              AuthRedirectWidget(
                mainText: 'Don\'t have an account?',
                buttonLabel: 'Sign up now',
                onTap: () => const SignUpRoute().push(context),
              ),
              TBScreenUtil.vSpace(30),
            ],
          ),
        ),
      ),
    );
  }
}
