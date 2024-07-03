import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';

class EpisodeImagesViewManager extends Notifier<Option<MangaChapter>> {
  @override
  Option<MangaChapter> build() => const None();

  void setModel(MangaChapter mc) => state = Some(mc);

  void removeModel() => state = const None();
}