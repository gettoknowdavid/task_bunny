import 'package:dartz/dartz.dart';

import 'value_failure.dart';
import 'value_object.dart';
import 'value_validators.dart';

class SingleLineString extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SingleLineString(String input) {
    return SingleLineString._(validateSingleLine(input));
  }

  const SingleLineString._(this.value);
}
