import '../../presentation/models/manga.dart';

abstract class MangaListRepository {
  Future<Iterable<Manga>> getMangas();
  Future<Manga?> getOneManga(String mangaId);
  void mangaChanged(Manga manga);
  void addManga(Manga manga);
}
