import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/styles.dart';
import '../../common/widget_button.dart';
import '../../manga_chapter_contents.dart/manga_chatper_contents_screen.dart';
import '../../models/manga_chapter.dart';
import '../../../providers.dart';

class MangaChapters extends ConsumerWidget {
  const MangaChapters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(SP.mangaManager).match(
        () => const SizedBox(),
        (manga) {
          final chapters = manga.chapters;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...chapters.indexed.expand(
                (ch) => [
                  _OneChapter(
                    index: ch.$1,
                    chapter: ch.$2,
                    mangaId: manga.mangaId,
                  ),
                  const Divider(height: 1),
                ],
              ),
              const _AddChapterButton(),
            ],
          );
        },
      );
}

class _CopyChapterLinkButton extends StatelessWidget {
  const _CopyChapterLinkButton({required this.chapterLink});

  final String chapterLink;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () => Clipboard.setData(ClipboardData(text: chapterLink)),
        icon: const Icon(Icons.link, color: Styles.primary),
      );
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
  final String mangaId;

  const _OneChapter({
    required this.index,
    required this.chapter,
    required this.mangaId,
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
          const SizedBox(width: 16),
          _CopyChapterLinkButton(
            chapterLink: 'https://tatmanga.ru/manga/$mangaId/${index + 1}',
          ),
        ],
      );

  void _openChapter(WidgetRef ref, BuildContext context) =>
      ref.read(SP.mangaManager).map(
        (manga) {
          final isEditing = ref.read(SP.editingModeOnManager);
          if (isEditing) {
            showCupertinoModalPopup(
              context: context,
              builder: (context) =>
                  MangaChapterContentsScreen(chapterIndex: index),
            );
          } else {
            Beamer.of(context).beamToNamed('${index + 1}');
          }
        },
      );
}
