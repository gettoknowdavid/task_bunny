import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:task_bunny/core/core.dart';

class TBAuthTextFormField extends FormField<String> {
  final String label;
  final IconData icon;
  final String hintText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool isPassword;
  final void Function(String)? onChanged;

  TBAuthTextFormField({
    super.key,
    super.initialValue,
    super.autovalidateMode,
    super.enabled = true,
    super.validator,
    required this.label,
    required this.icon,
    required this.hintText,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
    this.isPassword = false,
    this.onChanged,
  }) : super(
          builder: (field) {
            void onChangedHandler(String value) {
              field.didChange(value);
              onChanged?.call(value);
            }

            return _TextFormFieldWidget(
              hasError: field.hasError,
              errorText: field.errorText,
              label: label,
              icon: icon,
              hintText: hintText,
              initialValue: initialValue,
              focusNode: focusNode,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              autofocus: autofocus,
              enabled: enabled,
              isPassword: isPassword,
              onChanged: onChangedHandler,
            );
          },
        );

  @override
  _TBAuthTextFormFieldState createState() => _TBAuthTextFormFieldState();
}

class _TBAuthTextFormFieldState extends FormFieldState<String> {
  @override
  TBAuthTextFormField get widget => super.widget as TBAuthTextFormField;
}

class _TextFormFieldWidget extends HookWidget {
  const _TextFormFieldWidget({
    required this.hasError,
    required this.errorText,
    required this.label,
    required this.icon,
    required this.hintText,
    required this.enabled,
    required this.isPassword,
    required this.autofocus,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
  });

  final bool hasError;
  final String? errorText;
  final String? initialValue;
  final String label;
  final IconData icon;
  final String hintText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool isPassword;
  final bool enabled;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final color = hasError ? colors.error : colors.onSurface;

    final obscure = useState<bool>(isPassword);

    return Container(
      decoration: ShapeDecoration(
        color: color.opaque(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: TBBorderRadius.all(12),
          side: BorderSide(width: 2, color: color),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: TBEdgeInsets.symmetric(h: 12, v: 8),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: TBBorderRadius.v(top: 12),
              border: const Border(bottom: BorderSide(width: 2)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: TBScreenUtil.sp(16)),
                if (hasError) ...[
                  TBScreenUtil.hSpace(6),
                  Text(
                    errorText!,
                    style: TBTextStyle.error.copyWith(color: color),
                  ),
                ] else ...[
                  TBScreenUtil.hSpace(6),
                  Text(label, style: TBTextStyle.label),
                ]
              ],
            ),
          ),
          Divider(height: 0, color: color, thickness: 2),
          TBScreenUtil.vSpace(2),
          TextFormField(
            style: TBTextStyle.bodyRegular.copyWith(color: colors.onSurface),
            focusNode: focusNode,
            keyboardType: keyboardType,
            initialValue: initialValue,
            textInputAction: textInputAction,
            autofocus: autofocus,
            enabled: enabled,
            obscureText: obscure.value,
            autocorrect: false,
            onChanged: onChanged,
            validator: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              contentPadding: TBEdgeInsets.all(12),
              suffixIconColor: color,
              suffixIcon: !isPassword ? null : _EyeIcon(obscure: obscure),
            ),
          ),
          TBScreenUtil.vSpace(2),
        ],
      ),
    );
  }
}

class _EyeIcon extends StatelessWidget {
  const _EyeIcon({required this.obscure});

  final ValueNotifier<bool> obscure;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => obscure.value = !obscure.value,
      icon: Icon(
        obscure.value ? PhosphorIconsBold.eye : PhosphorIconsBold.eyeSlash,
        size: TBScreenUtil.r(18),
      ),
    );
  }
}
