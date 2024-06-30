import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';

part 'manga_chapter.freezed.dart';

@freezed
class MangaChapter with _$MangaChapter {
  const factory MangaChapter({
    required String? name,
    required List<StatusImageData> pageImages,
  }) = _MangaChapter;

}
