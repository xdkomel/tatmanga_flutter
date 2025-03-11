import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../../data/id_generator.dart';
import '../models/firebase_chapter.dart';
import '../models/manga_config.dart';
import '../models/single_image.dart';
import '../../presentation/models/author.dart';
import '../../presentation/models/image_data.dart';
import '../../presentation/models/manga.dart';
import '../../presentation/models/manga_chapter.dart';
import '../../presentation/models/status_image_data.dart';

extension MangaConfigToManga on MangaConfig {
  Manga toManga(IdGenerator idGenerator) => Manga(
        mangaId: mangaId,
        title: title,
        description: description,
        cover: coverImage == null ? null : _toStatusImageData(coverImage!),
        authors: authors
                ?.map(
                  (au) => Author(
                    name: au.name,
                    role: au.role,
                    id: idGenerator.generateId(),
                  ),
                )
                .toIList() ??
            const IList.empty(),
        chapters: chapters
            .map(
              (ch) => MangaChapter(
                id: idGenerator.generateId(),
                name: ch.chapterName,
                images: switch (ch.images) {
                  ChapterImagesFiles cif => MangaChapterImages.list(
                      images: cif.images.map(_toStatusImageData).toIList(),
                    ),
                  ChapterImagesTelegraphChapter cit =>
                    MangaChapterImages.stored(
                      url: 'https://www.telegra.ph/${cit.telegraphUrl}',
                    ),
                  ChapterImagesUrlChapter ciu => MangaChapterImages.stored(
                      url: ciu.url,
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
