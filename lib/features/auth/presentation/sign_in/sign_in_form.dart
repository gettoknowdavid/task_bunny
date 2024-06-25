import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/application/application.dart';
import 'package:task_bunny/features/features.dart';
import 'package:task_bunny/utils/utils.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _EmailField(),
          TBScreenUtil.vSpace(20),
          const _PasswordField(),
          TBScreenUtil.vSpace(6),
          Align(
            alignment: Alignment.centerRight,
            child: TBTextButton(
              label: 'Forgot password?',
              onTap: () => TBRouter.of(context).push(TBRoutes.forgotPassword),
            ),
          ),
          TBScreenUtil.vSpace(30),
          const _SignInButton(),
        ],
      ),
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
