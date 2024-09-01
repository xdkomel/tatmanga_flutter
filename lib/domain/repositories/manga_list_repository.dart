import 'package:tatmanga_flutter/presentation/models/manga.dart';

abstract class MangaListRepository {
  Future<Iterable<Manga>> getMangas();
}