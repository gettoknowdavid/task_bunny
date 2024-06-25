import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bunny/common/widgets/widgets.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/application/forgot_password/forgot_password_form_cubit.dart';
import 'package:task_bunny/utils/utils.dart';

import 'forgot_password_form.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocListener<ForgotPasswordFormCubit, ForgotPasswordFormState>(
      listenWhen: (p, c) => p.option != c.option,
      listener: (context, state) {
        state.option.fold(
          () => null,
          (failureOrSuccess) => failureOrSuccess.fold(
            (exception) => context.showTBSnackBar(exception.maybeWhen(
              orElse: () => TBStrings.unknownError,
              message: (message) => message,
            )),
            (_) => const CheckYourMailRoute().go(context),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TBText('Forgot Password'),
          toolbarHeight: TBScreenUtil.h(100),
        ),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            padding: TBEdgeInsets.symmetric(h: Insets.large),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TBScreenUtil.vSpace(20),
                TBText(
                  'Forgot you password? Don\'t worry, it happens.\nEnter your email address and we\'ll send you a link to reset your password.',
                  style: TBTextStyle.captionBold,
                  color: colors.onSurface.opaque(0.8),
                ),
                TBScreenUtil.vSpace(40),
                const ForgotPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
