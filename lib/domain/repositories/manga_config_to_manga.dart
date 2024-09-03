import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:tatmanga_flutter/domain/models/firebase_chapter.dart';
import 'package:tatmanga_flutter/domain/models/manga_config.dart';
import 'package:tatmanga_flutter/domain/models/single_image.dart';
import 'package:tatmanga_flutter/presentation/models/author.dart';
import 'package:tatmanga_flutter/presentation/models/image_data.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';
import 'package:tatmanga_flutter/utils/fp.dart';
import 'package:uuid/uuid.dart';

extension MangaConfigToManga on MangaConfig {
  Manga toManga(Uuid uuid) => Manga(
        mangaId: mangaId,
        title: title,
        description: description,
        cover: coverImage.map(_toStatusImageData),
        authors: authors
                ?.map(
                  (au) => Author(
                    name: au.name,
                    role: au.role,
                    id: uuid.v4(),
                  ),
                )
                .toIList() ??
            const IList.empty(),
        chapters: chapters
            .map(
              (ch) => MangaChapter(
                id: uuid.v4(),
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

StatusImageData _toStatusImageData(SingleImage image) => StatusImageData(
      status: ImageDataStatus.none,
      image: switch (image) {
        SingleImageUrl siu => UrlImage(siu.url),
        SingleImageFirebaseFile sif => NamedImage(sif.fileName),
      },
    );
