import 'dart:collection';

import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/utils/fp.dart';
import 'package:tatmanga_flutter/data/telegraph.dart';
import 'package:tatmanga_flutter/domain/repositories/manga_chapter_images_repository.dart';

class MangaChapterImagesRepositoryImpl extends MangaChapterImagesRepository {
  final Telegraph _telegraph;
  final HashMap<String, Iterable<String>> _cache = HashMap();

  MangaChapterImagesRepositoryImpl(this._telegraph);

  @override
  Future<Either<String, Iterable<String>>> getImagesUrls(
    String chapterUrl,
  ) =>
      _cache[chapterUrl].fold(
        () async {
          print('Loading for $chapterUrl');
          final result = await _telegraph.getImagesUrls(chapterUrl);
          result.map((urls) => _cache[chapterUrl] = urls);
          return result;
        },
        (urls) => Future.value(
          Either.of(urls),
        ),
      );
}
