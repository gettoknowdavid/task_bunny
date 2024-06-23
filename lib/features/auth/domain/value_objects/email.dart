import 'package:dartz/dartz.dart';
import 'package:task_bunny/core/core.dart';

class Email extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Email(String input) {
    return Email._(validateEmail(input).flatMap(validateNotEmpty));
  }

  const Email._(this.value);
}
