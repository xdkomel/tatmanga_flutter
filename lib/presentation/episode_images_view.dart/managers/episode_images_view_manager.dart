import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/presentation/models/image_data.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';
import 'package:tatmanga_flutter/utils/fp.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';
import 'package:tatmanga_flutter/providers.dart';

class EpisodeImagesViewManager extends Notifier<Option<MangaChapter>> {
  @override
  Option<MangaChapter> build() => const None();

  void setModel(MangaChapter mc) => state = Some(mc);

  void removeModel() => state = const None();

  Future<void> loadImages() => state.fold(
        Future.value,
        (mc) => switch (mc.images) {
          MangaChapterImagesStored stored => stored.url.fold(
              Future.value,
              (u) => _loadImages(u, mc, stored),
            ),
          _ => Future.value(),
        },
      );

  Future<void> _loadImages(
    String url,
    MangaChapter mc,
    MangaChapterImagesStored imgs,
  ) async {
    setModel(mc.copyWith(images: imgs.copyWith(loading: true)));
    final urls = await ref
        .read(
          P.mangaChapterImagesRepository,
        )
        .getImagesUrls(url);
    setModel(
      mc.copyWith(
        images: urls.fold(
          (msg) => imgs.copyWith(loading: false, errorMessage: msg),
          (urls) => MangaChapterImages.list(
            images: urls
                .map(
                  (u) => StatusImageData(
                    status: ImageDataStatus.none,
                    image: UrlImage(u),
                  ),
                )
                .toIList(),
          ),
        ),
      ),
    );
  }
}
