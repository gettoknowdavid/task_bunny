import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/application/application.dart';
import 'package:task_bunny/utils/utils.dart';

import 'sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          toolbarHeight: TBScreenUtil.h(80),
        ),
        body: SingleChildScrollView(
          padding: TBEdgeInsets.symmetric(h: Insets.large),
          child: const SignInForm(),
        ),
      ),
    );
  }
}
