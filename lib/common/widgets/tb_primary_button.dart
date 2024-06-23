import 'package:flutter/material.dart';

import 'tb_loading_indicator.dart';

class TBPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool loading;
  final bool disabled;
  final IconData? _icon;

  const TBPrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.loading = false,
    this.disabled = false,
  }) : _icon = null;

  const TBPrimaryButton.icon({
    super.key,
    required this.label,
    required this.onTap,
    this.loading = false,
    this.disabled = false,
    required IconData? icon,
  }) : _icon = icon;

  @override
  Widget build(BuildContext context) {
    if (_icon == null) {
      return FilledButton(
        onPressed: loading || disabled ? null : onTap,
        child: loading ? const TBLoadingIndicator(dimension: 18) : Text(label),
      );
    } else {
      return FilledButton.icon(
        onPressed: loading || disabled ? null : onTap,
        label: loading ? const TBLoadingIndicator(dimension: 18) : Text(label),
        icon: loading ? null : Icon(_icon),
      );
    }
  }
}
