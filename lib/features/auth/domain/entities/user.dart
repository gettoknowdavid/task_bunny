import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/domain/value_objects/value_objects.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User implements IEntity {
  factory User({
    required UniqueID uid,
    required SingleLineString name,
    required Email email,
  }) = _User;
}
