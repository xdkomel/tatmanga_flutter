import 'package:tatmanga_flutter/data/storage.dart';
import 'package:tatmanga_flutter/domain/repositories/manga_config_to_manga.dart';
import 'package:tatmanga_flutter/domain/repositories/manga_list_repository.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:uuid/uuid.dart';

class MangaListRepositoryImpl extends MangaListRepository {
  final Storage _storage;
  final Uuid _uuid;

  MangaListRepositoryImpl(
    this._storage,
    this._uuid,
  );

  @override
  Future<Iterable<Manga>> getMangas() async {
    final configs = await _storage.downloadConfigs();
    return configs.map((c) => c.toManga(_uuid));
  }
}
