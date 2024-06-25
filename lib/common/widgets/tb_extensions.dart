import 'package:flutter/material.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/core/tb_screen_util.dart';

extension TBBuildContextX on BuildContext {
  Future<T?> showTBModal<T>({
    required Widget Function(BuildContext) builder,
    bool isScrollControlled = false,
  }) {
    final colors = Theme.of(this).colorScheme;
    return showModalBottomSheet(
      context: this,
      builder: builder,
      showDragHandle: true,
      useRootNavigator: true,
      isScrollControlled: isScrollControlled,
      constraints: TBConstraints.value(maxWidth: TBScreenUtil.sw(0.92)),
      shape: TBBorderRadius.squircleBorder(
        radius: 16,
        side: BorderSide(color: colors.onSurface, width: TBScreenUtil.w(2)),
      ),
    );
  }

  Future<T?> showTBDialog<T>({
    required Widget Function(BuildContext) builder,
  }) {
    return showDialog(
      context: this,
      builder: builder,
    );
  }

  Future<void> showTBLoadingDialog({bool isDismissible = false}) {
    return showDialog(
      context: this,
      barrierDismissible: isDismissible,
      builder: (context) => AlertDialog(
        insetPadding: TBEdgeInsets.symmetric(h: TBScreenUtil.sw(0.4)),
        contentPadding: TBEdgeInsets.symmetric(v: 16),
        content: SizedBox(
          height: TBScreenUtil.sw(0.1),
          width: TBScreenUtil.sw(0.1),
          child: const TBLoadingIndicator(),
        ),
      ),
    );
  }
}
