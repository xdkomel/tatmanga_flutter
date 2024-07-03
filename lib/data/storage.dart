import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/domain/models/manga_config.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class Storage {
  final _ref = FirebaseStorage.instance.ref();

  final HashMap<String, String> _linksCache = HashMap();

  Future<Iterable<MangaConfig>> downloadConfigs() async {
    final mangas = await _ref.listAll();
    return mangas.prefixes
        .map(
          (r) => throwable(() async {
            final configData = await r.child('config.json').getData();
            final configStr = utf8.decode(configData!);
            final json = jsonDecode(configStr) as Map<String, dynamic>;
            return MangaConfig.fromJson(json);
          }).toNullable(),
        )
        .nonNulls
        .wait;
  }

  Future<String?> getUrl(String mangaId, String fileName) {
    final path = '$mangaId/$fileName';
    return _linksCache[path].fold(
      () => throwable(_ref.child(path).getDownloadURL)
          .fold(
            (_) => Future.value(null),
            identity,
          )
          .then(
            (url) => url.fold(
              () => null,
              (url) {
                _linksCache[path] = url;
                return url;
              },
            ),
          ),
      Future.value,
    );
  }

  Future<void> uploadConfig(MangaConfig config) {
    return throwable(() async {
      final json = jsonEncode(config.toJson());
      await _ref.child('${config.mangaId}/config.json').putString(json);
    }).fold(
      (a) async => print(a),
      identity,
    );
  }

  Future<void> uploadImage(String mangaId, String imageName, Uint8List bytes) =>
      throwable(
        () => _ref.child('$mangaId/$imageName').putData(bytes),
      ).fold(
        (a) async => print(a),
        identity,
      );

  Future<void> removeImage(String mangaId, String imageName) => throwable(
        _ref.child('$mangaId/$imageName').delete,
      ).fold(
        (a) async => print(a),
        identity,
      );

  // Future<void> removeManga(String mangaId) => throwable(
  //       _ref.child(mangaId).delete,
  //     ).fold(
  //       (a) async => print(a),
  //       identity,
  //     );
}
