import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tatmanga_flutter/domain/models/single_image.dart';

part 'firebase_chapter.freezed.dart';
part 'firebase_chapter.g.dart';

@freezed
class FirebaseChapter with _$FirebaseChapter {
  const factory FirebaseChapter({
    @JsonKey(name: 'chapter_name') required String? chapterName,
    @JsonKey(name: 'chapter_images') required ChapterImages images,
  }) = _FirebaseChapter;

  factory FirebaseChapter.fromJson(Map<String, dynamic> json) =>
      _$FirebaseChapterFromJson(json);
}

@Freezed(
  unionKey: 'chapter_images_type',
  unionValueCase: FreezedUnionCase.snake,
)
sealed class ChapterImages with _$ChapterImages {
  const factory ChapterImages.files({
    required List<SingleImage> images,
  }) = ChapterImagesFiles;
  const factory ChapterImages.telegraphChapter({
    @JsonKey(name: 'telegraph_url') required String telegraphUrl,
  }) = ChapterImagesTelegraphChapter;

  factory ChapterImages.fromJson(Map<String, dynamic> json) =>
      _$ChapterImagesFromJson(json);
}
