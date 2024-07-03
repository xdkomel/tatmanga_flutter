import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tatmanga_flutter/domain/models/firebase_chapter.dart';
import 'package:tatmanga_flutter/domain/models/manga_config.dart';
import 'package:tatmanga_flutter/presentation/models/author.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';

part 'manga.freezed.dart';

@freezed
class Manga with _$Manga {
  const factory Manga({
    required String mangaId,
    required String title,
    required String? description,
    required StatusImageData? cover,
    required IList<Author> authors,
    required IList<MangaChapter> chapters,
    required bool configUploading,
  }) = _Manga;
}

extension EditingMangaModelExtension on Manga {
  MangaConfig get toConfig => MangaConfig(
        mangaId: mangaId,
        title: title,
        description: description,
        coverName: cover?.image.name,
        authors: authors
            .map(
              (a) => AuthorData(name: a.name, role: a.role),
            )
            .toList(),
        chapters: chapters
            .map(
              (e) => FirebaseChapter(
                name: e.name,
                filesNames: e.pageImages.map((i) => i.image.name).toList(),
              ),
            )
            .toList(),
      );
}
