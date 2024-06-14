import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import 'package:task_bunny/core/tb_value_objects/src/value_failure.dart';

import 'value_object.dart';

class UniqueID extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const UniqueID._(this.value);

  factory UniqueID() {
    return UniqueID._(right(const Uuid().v1()));
  }

  /// Used with strings we trust are unique, such as database IDs.
  factory UniqueID.fromUniqueString(String uniqueIdStr) {
    return UniqueID._(right(uniqueIdStr));
  }
}
