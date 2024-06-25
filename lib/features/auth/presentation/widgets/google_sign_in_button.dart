import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/features/auth/application/application.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<SignInFormCubit>();
    return TBSecondaryButton.icon(
      onTap: bloc.signInWithGoogle,
      label: 'Sign In with Google',
      icon: PhosphorIconsBold.googleLogo,
      loading: bloc.state.googleSignInLoading,
    );
  }
}
