import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';
import '../../data/storage.dart';

import '../../utils/limited_hash_map.dart';
import 'manga_content_repository.dart';
import '../../presentation/models/manga.dart';

class MangaContentRepositoryImpl extends MangaContentRepository {
  final Storage _storage;
  // final Uuid _uuid;

  MangaContentRepositoryImpl(
    this._storage,
    // this._uuid,
  );

  final LimitedHashMap<String, String> _linksCache = LimitedHashMap(20);

  @override
  Future<Option<String>> getDownloadUrl(String mangaId, String fileName) {
    final key = '$mangaId/$fileName';
    return _linksCache.get(key).match(
      () async {
        final image = await _storage.getUrl(mangaId, fileName);
        if (image != null) {
          _linksCache.put(key, image);
        }
        return Option.fromNullable(image);
      },
      (url) => Future.value(Option.of(url)),
    );
  }

  @override
  Future<void> removeImage(String mangaId, String imageName) =>
      _storage.removeImage(mangaId, imageName);

  @override
  Future<void> uploadConfig(Manga configModel) =>
      _storage.uploadConfig(configModel.toConfig);

  @override
  Future<void> uploadImage(String mangaId, String imageName, Uint8List bytes) =>
      _storage.uploadImage(mangaId, imageName, bytes);

  // @override
  // Future<Option<Manga>> getMangaById(String mangaId) async {
  //   final config = await _storage.loadConfig(mangaId);
  //   return config.map((c) => c.toManga(_uuid));
  // }
}
