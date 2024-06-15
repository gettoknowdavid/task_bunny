import 'package:dartz/dartz.dart';
import 'package:task_bunny/core/core.dart';

class Email extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Email(String input) => Email._(validateEmail(input));

  const Email._(this.value);
}
