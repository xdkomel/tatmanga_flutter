import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:tatmanga_flutter/data/storage.dart';
import 'package:tatmanga_flutter/domain/models/firebase_chapter.dart';
import 'package:tatmanga_flutter/domain/models/manga_config.dart';
import 'package:tatmanga_flutter/domain/models/single_image.dart';
import 'package:tatmanga_flutter/domain/repositories/manga_list_repository.dart';
import 'package:tatmanga_flutter/presentation/models/image_data.dart';
import 'package:tatmanga_flutter/presentation/models/author.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';
import 'package:tatmanga_flutter/utils/fp.dart';
import 'package:uuid/uuid.dart';

class MangaListRepositoryImpl extends MangaListRepository {
  final Storage _storage;
  final Uuid _uuid;

  MangaListRepositoryImpl(
    this._storage,
    this._uuid,
  );

  @override
  Future<Iterable<Manga>> getMangas() async {
    final configs = await _storage.downloadConfigs();
    return configs.map(_toManga);
  }

  StatusImageData _toStatusImageData(SingleImage image) => StatusImageData(
        status: ImageDataStatus.none,
        image: switch (image) {
          SingleImageUrl siu => UrlImage(siu.url),
          SingleImageFirebaseFile sif => NamedImage(sif.fileName),
        },
      );

  Manga _toManga(MangaConfig config) => Manga(
        mangaId: config.mangaId,
        title: config.title,
        description: config.description,
        cover: config.coverImage.map(_toStatusImageData),
        authors: config.authors
                ?.map(
                  (au) => Author(
                    name: au.name,
                    role: au.role,
                    id: _uuid.v4(),
                  ),
                )
                .toIList() ??
            const IList.empty(),
        chapters: config.chapters
            .map(
              (ch) => MangaChapter(
                id: _uuid.v4(),
                name: ch.chapterName,
                images: switch (ch.images) {
                  ChapterImagesFiles cif => MangaChapterImages.list(
                      images: cif.images.map(_toStatusImageData).toIList(),
                    ),
                  ChapterImagesTelegraphChapter cit =>
                    MangaChapterImages.stored(
                      url: cit.telegraphUrl,
                      loading: false,
                    ),
                },
              ),
            )
            .toIList(),
        configUploading: false,
      );
}
