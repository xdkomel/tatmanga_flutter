import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/providers.dart';

class MangaLoadingManager extends Notifier<Option<IList<Manga>>> {
  @override
  Option<IList<Manga>> build() => const None();

  Future<void> loadManga() async {
    final configs = await ref.read(P.mangaListRepository).getMangas();
    state = Some(configs.toIList());
  }

  void addManga() => state = state.map(
        (ms) => ms.add(
          Manga(
            mangaId: ref.read(P.uuid).v4(),
            title: 'Заголовок',
            description: null,
            cover: null,
            authors: const IList.empty(),
            chapters: const IList.empty(),
            configUploading: false,
          ),
        ),
      );

  void updateManga(Manga manga) => state = state.map(
        (ms) => ms.replaceFirstWhere(
          (m) => m.mangaId == manga.mangaId,
          (_) => manga,
        ),
      );
}
