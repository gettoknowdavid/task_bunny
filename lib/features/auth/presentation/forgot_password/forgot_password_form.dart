import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:task_bunny/common/widgets/widgets.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/application/application.dart';
import 'package:task_bunny/utils/utils.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _EmailField(),
        TBScreenUtil.vSpace(50),
        const _SubmitButton(),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordFormCubit, ForgotPasswordFormState>(
      buildWhen: (p, c) => p.email != c.email || p.loading != c.loading,
      builder: (context, state) => TBAuthTextFormField(
        label: 'Email Address',
        icon: PhosphorIconsBold.at,
        hintText: 'Your registered email address',
        textInputAction: TextInputAction.go,
        onChanged: context.read<ForgotPasswordFormCubit>().emailChanged,
        enabled: !state.loading,
        validator: (_) => context.validator(state.email.value),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return TBPrimaryButton(
      label: 'Submit',
      loading: context.watch<ForgotPasswordFormCubit>().state.loading,
      onTap: () {
        if (Form.of(context).validate()) {
          context.read<ForgotPasswordFormCubit>().sendResetPasswordLink();
        }
      },
    );
  }
}
