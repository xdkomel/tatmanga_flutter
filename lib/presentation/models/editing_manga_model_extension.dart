import 'package:tatmanga_flutter/domain/models/firebase_chapter.dart';
import 'package:tatmanga_flutter/domain/models/manga_config.dart';
import 'package:tatmanga_flutter/presentation/models/editing_manga_model.dart';

extension EditingMangaModelExtension on EditingMangaModel {
  MangaConfig get toConfig => MangaConfig(
        mangaId: mangaId,
        title: name,
        description: description,
        coverName: coverImage.name,
        authors: authors.toList(),
        chapters: episodes
            .map(
              (e) => FirebaseChapter(
                name: e.name,
                filesNames: e.images.map((i) => i.image.name).toList(),
              ),
            )
            .toList(),
      );
}
