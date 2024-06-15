import 'package:flutter/material.dart';

final class TBInternal {
  TBInternal._();

  /// Convenience method for easier use of [WidgetStateProperty.all].
  static WidgetStateProperty<T> all<T>(T value) {
    return WidgetStateProperty.all(value);
  }

  /// Convenience method for resolving light and dark themes.
  static T r<T>(bool isLight, T lightValue, T darkValue) {
    return isLight ? lightValue : darkValue;
  }

  /// Convenience method for easier use of [WidgetStateProperty.resolveWith].
  static WidgetStateProperty<T?> resolveWith<T>({
    required T defaultValue,
    T? pressedValue,
    T? disabledValue,
    T? hoveredValue,
    String? parent,
    T? selectedValue,
  }) {
    return WidgetStateProperty.resolveWith((states) {
      // disabled
      if (states.contains(WidgetState.disabled) && disabledValue != null) {
        return disabledValue;
      }

      // pressed / focused
      if (states.any({WidgetState.pressed, WidgetState.focused}.contains) &&
          pressedValue != null) {
        return pressedValue;
      }
      // hovered
      if (states.contains(WidgetState.hovered) && hoveredValue != null) {
        return hoveredValue;
      }

      // selected
      if (states.contains(WidgetState.selected) && selectedValue != null) {
        return selectedValue;
      }
      // default
      return defaultValue;
    });
  }
}
