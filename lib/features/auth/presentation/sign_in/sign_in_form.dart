import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/application/application.dart';
import 'package:task_bunny/utils/utils.dart';

import '../widgets/widgets.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TBScreenUtil.vSpace(20),
          TBText(
            'Continue with Google or you sign in with your email and password.',
            style: TBTextStyle.captionBold,
            color: colors.onSurface.opaque(0.8),
          ),
          TBScreenUtil.vSpace(16),
          const GoogleSignInButton(),
          TBScreenUtil.vSpace(24),
          const OrDividerWidget(),
          TBScreenUtil.vSpace(24),
          const _EmailField(),
          TBScreenUtil.vSpace(20),
          const _PasswordField(),
          TBScreenUtil.vSpace(6),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('Forgot password?'),
            ),
          ),
          TBScreenUtil.vSpace(30),
          const _SignInButton(),
        ],
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return TBPrimaryButton(
      label: 'Sign In',
      loading: context.watch<SignInFormCubit>().state.loading,
      onTap: () {
        if (Form.of(context).validate()) {
          context.read<SignInFormCubit>().signIn();
        }
      },
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormCubit, SignInFormState>(
      buildWhen: (p, c) => p.email != c.email || p.loading != c.loading,
      builder: (context, state) => TBAuthTextFormField(
        label: 'Email Address',
        icon: PhosphorIconsBold.at,
        hintText: 'Your email address',
        onChanged: context.read<SignInFormCubit>().emailChanged,
        enabled: !state.loading,
        validator: (_) => context.validator(state.email.value),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormCubit, SignInFormState>(
      buildWhen: (p, c) => p.password != c.password || p.loading != c.loading,
      builder: (context, state) => TBAuthTextFormField(
        label: 'Password',
        icon: PhosphorIconsBold.lock,
        hintText: 'Your password',
        isPassword: true,
        onChanged: context.read<SignInFormCubit>().passwordChanged,
        enabled: !state.loading,
        validator: (_) => context.validator(state.password.value),
      ),
    );
  }
}
