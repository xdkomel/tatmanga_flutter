import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/image_widget.dart';
import '../../common/styles.dart';
import '../../common/widget_button.dart';
import '../../models/manga.dart';
import '../../../providers.dart';
import '../../../utils/fp.dart';

class MangaCard extends ConsumerWidget {
  final Manga manga;
  final double width;

  const MangaCard({
    required this.manga,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => Stack(
        children: [
          WidgetButton(
            onTap: () => _openManga(ref, context),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: width - 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    manga.cover.fold(
                      () => const SizedBox(),
                      (cover) => ImageWidget(
                        imageData: cover.image,
                        mangaId: manga.mangaId,
                        width: width - 32,
                        height: width - 32,
                        fit: BoxFit.cover,
                        radius: 4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      manga.title,
                      style: Styles.h3b,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 2),
                    _EpisodesCount(manga),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  void _openManga(WidgetRef ref, BuildContext context) =>
      Beamer.of(context).beamToNamed('/manga/${manga.mangaId}');
}

class _EpisodesCount extends ConsumerWidget {
  final Manga _manga;

  const _EpisodesCount(this._manga);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Text(
        ref
            .watch(SP.localizationManager)
            .translations
            .mangaList
            .episodesCount
            .episodes(n: _manga.chapters.length),
        textAlign: TextAlign.start,
        style: Styles.pr.copyWith(color: Styles.prime300),
      );
}
