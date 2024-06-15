import 'package:dartz/dartz.dart';
import 'package:task_bunny/core/core.dart';

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) => Password._(validatePassword(input));

  const Password._(this.value);
}
