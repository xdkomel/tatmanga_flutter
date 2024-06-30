import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tatmanga_flutter/domain/models/manga_config.dart';
import 'package:tatmanga_flutter/presentation/common/image_data.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';

part 'manga.freezed.dart';

@freezed
class Manga with _$Manga {
  const factory Manga({
    required String mangaId,
    required String title,
    required String? description,
    required ImageData? cover,
    required List<AuthorData>? authors,
    required List<MangaChapter> chapters,
  }) = _Manga;
}
