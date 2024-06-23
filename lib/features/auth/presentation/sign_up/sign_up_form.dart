import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/application/application.dart';
import 'package:task_bunny/utils/utils.dart';

import '../widgets/widgets.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _NameField(),
          TBScreenUtil.vSpace(20),
          const _EmailField(),
          TBScreenUtil.vSpace(20),
          const _PasswordField(),
          TBScreenUtil.vSpace(30),
          const _SignUpButton(),
        ],
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormCubit, SignUpFormState>(
      buildWhen: (p, c) => p.name != c.name || p.loading != c.loading,
      builder: (context, state) => TBAuthTextFormField(
        label: 'Full Name',
        hintText: 'Your full name',
        icon: PhosphorIconsBold.identificationBadge,
        onChanged: context.read<SignUpFormCubit>().emailChanged,
        enabled: !state.loading,
        validator: (_) => context.validator(state.name.value),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormCubit, SignUpFormState>(
      buildWhen: (p, c) => p.email != c.email || p.loading != c.loading,
      builder: (context, state) => TBAuthTextFormField(
        label: 'Email Address',
        icon: PhosphorIconsBold.at,
        hintText: 'Your email address',
        onChanged: context.read<SignUpFormCubit>().emailChanged,
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
    return BlocBuilder<SignUpFormCubit, SignUpFormState>(
      buildWhen: (p, c) => p.password != c.password || p.loading != c.loading,
      builder: (context, state) => TBAuthTextFormField(
        label: 'Password',
        icon: PhosphorIconsBold.lock,
        hintText: 'Your password',
        isPassword: true,
        onChanged: context.read<SignUpFormCubit>().passwordChanged,
        enabled: !state.loading,
        validator: (_) => context.validator(state.password.value),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    return TBPrimaryButton(
      label: 'Sign Up',
      loading: context.watch<SignUpFormCubit>().state.loading,
      onTap: () {
        if (Form.of(context).validate()) {
          context.read<SignUpFormCubit>().signUp();
        }
      },
    );
  }
}
