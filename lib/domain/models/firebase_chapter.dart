import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_chapter.freezed.dart';
part 'firebase_chapter.g.dart';

@freezed
class FirebaseChapter with _$FirebaseChapter {
  factory FirebaseChapter({
    required String? name,
    @JsonKey(name: 'files_names') required List<String> filesNames,
  }) = _FirebaseChapter;

  factory FirebaseChapter.fromJson(Map<String, dynamic> json) =>
      _$FirebaseChapterFromJson(json);
}
