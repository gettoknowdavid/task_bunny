import 'package:freezed_annotation/freezed_annotation.dart';

import 'value_failure.dart';

part 'value_errors.freezed.dart';

@freezed
class ValueError with _$ValueError {
  const factory ValueError.noteAuthenticated() = _NotAuthenticatedError;
  const factory ValueError.unexpectedError(ValueFailure failure) =
      _UnexpectedValueError;

  @override
  String toString() {
    return when(
      noteAuthenticated: () => 'Not authenticated',
      unexpectedError: (failure) {
        const message = 'Encountered an unexpected ValueFailure. Terminating.';
        return Error.safeToString('$message Failure was: $failure');
      },
    );
  }
}
