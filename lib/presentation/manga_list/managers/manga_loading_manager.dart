import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/domain/models/manga_config.dart';
import 'package:tatmanga_flutter/presentation/common/image_data.dart';
import 'package:tatmanga_flutter/presentation/models/author.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class MangaLoadingManager extends Notifier<Option<IList<Manga>>> {
  @override
  Option<IList<Manga>> build() => const None();

  Future<void> loadManga() async {
    final configs = await ref.read(P.storage).downloadConfigs();
    state = Some(configs.map(_toManga).toIList());
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

  // Future<void> removeManga(String mangaId) async {
  //   final oldState = state;
  //   state = const None();
  //   await ref.read(P.storage).removeManga(mangaId);
  //   state = oldState.map(
  //     (l) => l.removeWhere((m) => m.mangaId == mangaId),
  //   );
  // }

  Manga _toManga(MangaConfig config) => Manga(
        mangaId: config.mangaId,
        title: config.title,
        description: config.description,
        cover: config.coverName.map(
          (name) => StatusImageData(
            status: ImageDataStatus.none,
            image: NamedImage(name),
          ),
        ),
        authors: config.authors
                ?.map(
                  (au) => Author(
                    name: au.name,
                    role: au.role,
                    id: ref.read(P.uuid).v4(),
                  ),
                )
                .toIList() ??
            const IList.empty(),
        chapters: config.chapters
            .map(
              (ch) => MangaChapter(
                id: ref.read(P.uuid).v4(),
                name: ch.name,
                pageImages: ch.filesNames
                    .map(
                      (fn) => StatusImageData(
                        status: ImageDataStatus.none,
                        image: NamedImage(fn),
                      ),
                    )
                    .toIList(),
              ),
            )
            .toIList(),
        configUploading: false,
      );
}
