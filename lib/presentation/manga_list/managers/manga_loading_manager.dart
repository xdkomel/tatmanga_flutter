import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../models/manga.dart';
import '../../../providers.dart';

class MangaLoadingManager extends Notifier<Option<IList<Manga>>> {
  @override
  Option<IList<Manga>> build() => const None();

  Future<void> loadManga() async {
    final configs = await ref.read(P.mangaListRepository).getMangas();
    state = Some(configs.toIList());
  }

  void addManga() {
    final newManga = Manga(
      mangaId: ref.read(P.idGenerator).generateId(),
      title: 'Заголовок',
      description: null,
      cover: null,
      authors: const IList.empty(),
      chapters: const IList.empty(),
      configUploading: false,
    );
    ref.read(P.mangaListRepository).addManga(newManga);
    state = state.map((ms) => ms.add(newManga));
  }

  void updateManga() {
    ref.read(SP.mangaManager).map((manga) {
      ref.read(P.mangaListRepository).mangaChanged(manga);
      state = state.map(
        (ms) => ms.replaceFirstWhere(
          (m) => m.mangaId == manga.mangaId,
          (m) => ref.read(SP.mangaManager).match(
                () => m!,
                (nm) => nm,
              ),
        ),
      );
    });
  }
}
