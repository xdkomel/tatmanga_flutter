import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';
import '../domain/models/manga_config.dart';

class Storage {
  final _ref = FirebaseStorage.instance.ref();

  Future<Iterable<MangaConfig>> downloadConfigs() async {
    final mangas = await _ref.listAll();
    final configs = await mangas.prefixes.map(_getMangaConfig).wait;
    return configs.nonNulls;
  }

  Future<MangaConfig?> _getMangaConfig(Reference ref) async {
    final config = await TaskOption.tryCatch(() async {
      final configData = await ref.child('config.json').getData();
      final configStr = utf8.decode(configData!);
      final json = jsonDecode(configStr) as Map<String, dynamic>;
      return MangaConfig.fromJson(json);
    }).run();
    return config.toNullable();
  }

  Future<MangaConfig?> downloadOneConfig(String mangaId) =>
      _getMangaConfig(_ref.child(mangaId));

  Future<String?> getUrl(String mangaId, String fileName) async {
    final path = '$mangaId/$fileName';
    final url = await TaskOption.tryCatch(
      _ref.child(path).getDownloadURL,
    ).run();
    return url.toNullable();
  }

  Future<void> uploadConfig(MangaConfig config) =>
      TaskOption.tryCatch(() async {
        final json = jsonEncode(config.toJson());
        await _ref.child('${config.mangaId}/config.json').putString(json);
      }).run();

  Future<void> uploadImage(String mangaId, String imageName, Uint8List bytes) =>
      TaskOption.tryCatch(
        () => _ref.child('$mangaId/$imageName').putData(bytes),
      ).run();

  Future<void> removeImage(String mangaId, String imageName) =>
      TaskOption.tryCatch(
        _ref.child('$mangaId/$imageName').delete,
      ).run();
}
