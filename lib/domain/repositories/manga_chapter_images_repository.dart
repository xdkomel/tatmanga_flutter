import 'package:fpdart/fpdart.dart';

abstract class MangaChapterImagesRepository {
  Future<Either<String, Iterable<String>>> getImagesUrls(String chapterUrl);
}
