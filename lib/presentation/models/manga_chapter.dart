import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tatmanga_flutter/domain/models/firebase_chapter.dart';
import 'package:tatmanga_flutter/presentation/models/image_data_converter.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';

part 'manga_chapter.freezed.dart';

@freezed
class MangaChapter with _$MangaChapter {
  const factory MangaChapter({
    required String id,
    required String? name,
    required MangaChapterImages images,
  }) = _MangaChapter;
}

@freezed
sealed class MangaChapterImages with _$MangaChapterImages {
  const factory MangaChapterImages.list({
    required IList<StatusImageData> images,
  }) = MangaChapterImagesList;
  const factory MangaChapterImages.stored({
    required bool loading,
    String? errorMessage,
    String? url,
  }) = MangaChapterImagesStored;
}

extension MangaChapterToFirebase on MangaChapter {
  FirebaseChapter get toFirebaseChapter => FirebaseChapter(
        chapterName: name,
        images: switch (images) {
          MangaChapterImagesList list => ChapterImages.files(
              images: list.images.map((i) => i.image.toSingleImage).toList(),
            ),
          MangaChapterImagesStored images => ChapterImages.telegraphChapter(
              telegraphUrl: images.url ?? '',
            ),
        },
      );
}
