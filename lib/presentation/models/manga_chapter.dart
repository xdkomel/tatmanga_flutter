import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/models/firebase_chapter.dart';
import 'image_data_converter.dart';
import 'status_image_data.dart';

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
    required String? url,
  }) = MangaChapterImagesStored;
}

extension MangaChapterToFirebase on MangaChapter {
  FirebaseChapter? get toFirebaseChapter {
    final fcImages = switch (images) {
      MangaChapterImagesList list => ChapterImages.files(
          images: list.images.map((i) => i.image.toSingleImage).toList(),
        ),
      MangaChapterImagesStored images when images.url == null => null,
      MangaChapterImagesStored images => ChapterImages.urlChapter(
          url: images.url!,
        ),
    };
    if (fcImages == null) {
      return null;
    }
    return FirebaseChapter(
      chapterName: name,
      images: fcImages,
    );
  }
}
