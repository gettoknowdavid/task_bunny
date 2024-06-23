import 'package:dartz/dartz.dart';
import 'package:task_bunny/core/core.dart';

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input, {bool isSignIn = false}) {
    if (isSignIn) {
      return Password._(validateNotEmpty(input));
    } else {
      return Password._(validateNotEmpty(input).flatMap(validatePassword));
    }
  }

  const Password._(this.value);
}
