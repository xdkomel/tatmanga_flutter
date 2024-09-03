import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/data/telegraph.dart';
import 'package:tatmanga_flutter/domain/repositories/manga_chapter_images_repository.dart';
import 'package:tatmanga_flutter/utils/limited_hash_map.dart';

class MangaChapterImagesRepositoryImpl extends MangaChapterImagesRepository {
  final Telegraph _telegraph;
  final LimitedHashMap<String, Iterable<String>> _cache = LimitedHashMap(20);

  MangaChapterImagesRepositoryImpl(this._telegraph);

  @override
  Future<Either<String, Iterable<String>>> getImagesUrls(
    String chapterUrl,
  ) =>
      _cache.get(chapterUrl).fold(
        () async {
          final result = await _telegraph.getImagesUrls(chapterUrl);
          result.map((urls) => _cache.put(chapterUrl, urls));
          return result;
        },
        (urls) => Future.value(
          Either.of(urls),
        ),
      );
}
