import 'package:flutter/material.dart';
import 'package:task_bunny/core/core.dart';

class TBLoadingIndicator extends StatelessWidget {
  const TBLoadingIndicator({super.key, this.dimension = 22});

  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: TBScreenUtil.r(dimension),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
