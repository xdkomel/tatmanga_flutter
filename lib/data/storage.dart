import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:tatmanga_flutter/domain/models/manga_config.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class Storage {
  final _ref = FirebaseStorage.instance.ref();

  final HashMap<String, String> _linksCache = HashMap();

  Future<Iterable<MangaConfig>> downloadConfigs() async {
    final mangas = await _ref.listAll();
    final configs = await mangas.prefixes
        .map(
          (r) => futureThrowable(() async {
            final configData = await r.child('config.json').getData();
            final configStr = utf8.decode(configData!);
            final json = jsonDecode(configStr) as Map<String, dynamic>;
            return MangaConfig.fromJson(json);
          }),
        )
        .wait;
    return configs
        .map(
          (c) => c.toNullable(),
        )
        .nonNulls;
  }

  Future<String?> getUrl(String mangaId, String fileName) {
    final path = '$mangaId/$fileName';
    return _linksCache[path].fold(
      () async {
        final maybeUrl = await futureThrowable(
          _ref.child(path).getDownloadURL,
        );
        return maybeUrl.toNullable().also(
              (url) => url.map(
                (u) => _linksCache[path] = u,
              ),
            );
      },
      Future.value,
    );
  }

  Future<void> uploadConfig(MangaConfig config) {
    return futureThrowable(() async {
      final json = jsonEncode(config.toJson());
      await _ref.child('${config.mangaId}/config.json').putString(json);
    });
  }

  Future<void> uploadImage(String mangaId, String imageName, Uint8List bytes) =>
      futureThrowable(
        () => _ref.child('$mangaId/$imageName').putData(bytes),
      );

  Future<void> removeImage(String mangaId, String imageName) => futureThrowable(
        _ref.child('$mangaId/$imageName').delete,
      );
}
