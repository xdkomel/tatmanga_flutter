import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';

abstract class MangaContentRepository {
  Future<Option<String>> getDownloadUrl(String mangaId, String fileName);
  Future<void> uploadConfig(Manga configModel);
  Future<void> uploadImage(String mangaId, String imageName, Uint8List bytes);
  Future<void> removeImage(String mangaId, String imageName);
}
