import 'package:dartz/dartz.dart';
import 'package:task_bunny/core/core.dart';

class ProfilePicture extends ValueObject<String?> {
  @override
  final Either<ValueFailure<String>, String?> value;

  factory ProfilePicture(String? input) {
    return ProfilePicture._(validateImageUrl(input));
  }

  const ProfilePicture._(this.value);
}
