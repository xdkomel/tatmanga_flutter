import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/widget_button.dart';
import 'package:tatmanga_flutter/presentation/episode_images_view.dart/episode_images_view_screen.dart';
import 'package:tatmanga_flutter/presentation/manga_chapter_contents.dart/manga_chatper_contents_screen.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';
import 'package:tatmanga_flutter/providers.dart';

class MangaChapters extends ConsumerWidget {
  const MangaChapters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref
          .watch(SP.mangaManager.select((m) => m.map((m) => m.chapters)))
          .map(
            (chapters) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...chapters.indexed.expand(
                  (ch) => [
                    _OneChapter(index: ch.$1, chapter: ch.$2),
                    const Divider(height: 1),
                  ],
                ),
                const _AddChapterButton(),
              ],
            ),
          )
          .toNullable() ??
      const SizedBox();
}

class _RemoveChapterButton extends ConsumerWidget {
  final int index;

  const _RemoveChapterButton({required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(SP.editingModeOnManager)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                onPressed: () =>
                    ref.read(SP.mangaManager.notifier).removeChapter(index),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
              ),
            )
          : const SizedBox();
}

class _AddChapterButton extends ConsumerWidget {
  const _AddChapterButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(SP.editingModeOnManager)
          ? WidgetButton(
              onTap: ref.read(SP.mangaManager.notifier).addChapter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  ref
                      .watch(SP.localizationManager)
                      .translations
                      .mangaContents
                      .addEpisode,
                ),
              ),
            )
          : const SizedBox();
}

class _OneChapter extends ConsumerWidget {
  final int index;
  final MangaChapter chapter;

  const _OneChapter({
    required this.index,
    required this.chapter,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => Row(
        children: [
          Expanded(
            child: WidgetButton(
              onTap: () => _openChapter(ref, context),
              borderRadius: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${index + 1}',
                          style: Styles.pb.copyWith(color: Styles.prime012),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        chapter.name ??
                            ref
                                .watch(SP.localizationManager)
                                .translations
                                .mangaContents
                                .episodeDefault
                                .episode(n: index + 1),
                        style: Styles.pr.copyWith(color: Styles.prime200),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _RemoveChapterButton(index: index),
        ],
      );

  void _openChapter(
    WidgetRef ref,
    BuildContext context,
  ) =>
      ref.read(SP.mangaManager).map(
            (manga) => ref.read(SP.editingModeOnManager)
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MangaChatperContentsScreen(
                        chapterIndex: index,
                      ),
                    ),
                  )
                : _openEpisodeView(ref, context, index, manga),
          );

  Future<void> _openEpisodeView(
    WidgetRef ref,
    BuildContext context,
    int index,
    Manga manga, [
    bool startFromEnd = false,
  ]) async {
    ref.read(SP.episodeImagesViewManager.notifier).setModel(
          manga.chapters.get(index),
        );
    final value = await EpisodeImagesViewScreen.show(
      context,
      manga.mangaId,
      startFromEnd,
    );
    if (context.mounted) {
      return switch (value) {
        EpisodeImagesViewResponse.back when index > 0 => _openEpisodeView(
            ref,
            context,
            index - 1,
            manga,
            true,
          ),
        EpisodeImagesViewResponse.forward
            when index < manga.chapters.length - 1 =>
          _openEpisodeView(
            ref,
            context,
            index + 1,
            manga,
          ),
        _ => null,
      };
    }
  }
}
