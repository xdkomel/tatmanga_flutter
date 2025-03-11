import 'dart:async';

import '../../data/id_generator.dart';
import '../../data/storage.dart';
import 'manga_config_to_manga.dart';
import 'manga_list_repository.dart';
import '../../presentation/models/manga.dart';

class MangaListRepositoryImpl extends MangaListRepository {
  final Storage _storage;
  final IdGenerator _idGenerator;

  MangaListRepositoryImpl(
    this._storage,
    this._idGenerator,
  );

  late final _map = <String, Manga>{};
  // This completer is used to block the [getOneManga] from downloading the old
  // version of mangas list
  late final _completer = Completer();

  @override
  Future<Iterable<Manga>> getMangas() async {
    final configs = await _storage.downloadConfigs();
    final mangas = configs.map((c) => c.toManga(_idGenerator));
    for (final mg in mangas) {
      _map[mg.mangaId] = mg;
    }
    _completer.complete();
    return mangas;
  }

  @override
  Future<Manga?> getOneManga(String mangaId) async {
    await _completer.future;
    return _map[mangaId];
  }

  @override
  void mangaChanged(Manga manga) {
    _map[manga.mangaId] = manga;
    // final oldManga = _map[mangaId];
    // if (oldManga == null) {
    //   // Seems like nothing really changed, or an error
    //   return null;
    // }
    // _completer = Completer();
    // final manga = await _storage.downloadOneConfig(mangaId);
    // if (manga == null) {
    //   // Use the old version
    //   _completer.complete();
    //   return _map[mangaId]!;
    // }
    // _map[mangaId] = manga.toManga(_uuid);
    // _completer.complete();
  }

  @override
  addManga(Manga manga) {
    _map[manga.mangaId] = manga;
  }
}
