import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/core.dart';

import '../constants/constants.dart';

extension AuthX on BuildContext {
  String? validator(Either<ValueFailure<String>, String> value) {
    return value.fold(
      (exception) => exception.maybeWhen(
        orElse: () => TBStrings.unknownError,
        empty: (_) => TBStrings.emptyError,
        invalidEmail: (_) => TBStrings.invalidEmail,
        invalidPassword: (_) => TBStrings.invalidPassword,
      ),
      (_) => null,
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(
    String errorMessage,
  ) {
    final colors = Theme.of(this).colorScheme;
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: TBText(errorMessage, color: colors.onError),
        backgroundColor: colors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
