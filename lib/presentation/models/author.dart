import 'package:freezed_annotation/freezed_annotation.dart';

part 'author.freezed.dart';

@freezed
class Author with _$Author {
  factory Author({
    required String name,
    required String role,
    required String id,
  }) = _Author;
}
