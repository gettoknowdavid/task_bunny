import 'package:flutter/material.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/core.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        TBScreenUtil.hSpace(24),
        const TBText('Or'),
        TBScreenUtil.hSpace(24),
        const Expanded(child: Divider()),
      ],
    );
  }
}
