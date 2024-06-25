import 'package:flutter/material.dart';
import 'package:task_bunny/common/widgets/widgets.dart';
import 'package:task_bunny/core/core.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TBText('Forgot Password'),
        toolbarHeight: TBScreenUtil.h(100),
      ),
    );
  }
}
