import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'common_interfaces.dart';
import 'value_errors.dart';
import 'value_failure.dart';

@immutable
abstract class ValueObject<T> implements IValueObject {
  const ValueObject();

  @override
  int get hashCode => value.hashCode;

  @override
  bool get isValid => value.isRight();

  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOr() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw ValueError.unexpectedError(f), id);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  T getOrElse(T dflt) => value.getOrElse(() => dflt);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  @override
  String toString() => 'Value($value)';
}
