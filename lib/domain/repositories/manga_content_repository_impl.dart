import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/data/storage.dart';

import 'package:tatmanga_flutter/domain/repositories/manga_content_repository.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class MangaContentRepositoryImpl extends MangaContentRepository {
  final Storage _storage;
  // final Uuid _uuid;

  MangaContentRepositoryImpl(
    this._storage,
    // this._uuid,
  );

  @override
  Future<Option<String>> getDownloadUrl(String mangaId, String fileName) async {
    final image = await _storage.getUrl(mangaId, fileName);
    return image.toOption(identity);
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
