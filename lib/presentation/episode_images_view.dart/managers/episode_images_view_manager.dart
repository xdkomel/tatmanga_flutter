import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../models/manga_chapter.dart';
import '../../../providers.dart';

class EpisodeImagesViewManager extends Notifier<Option<MangaChapter>> {
  @override
  Option<MangaChapter> build() => const None();

  Future<void> loadModel(String mangaId, int chapterIndex) async {
    final manga = await ref.read(P.mangaListRepository).getOneManga(mangaId);
    if (manga == null) {
      return;
    }
    final chapter = manga.chapters.getOrNull(chapterIndex);
    if (chapter == null) {
      return;
    }
    setModel(chapter);
  }

  void setModel(MangaChapter mc) => state = Some(mc);

  void removeModel() => state = const None();
}
