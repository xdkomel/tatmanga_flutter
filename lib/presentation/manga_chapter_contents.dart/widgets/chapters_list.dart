import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/image_widget.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/widget_button.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class ChaptersList extends ConsumerWidget {
  final int chapterIndex;

  const ChaptersList({super.key, required this.chapterIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) => ref
      .read(SP.mangaManager)
      .map(
        (m) => m.mangaId,
      )
      .fold(
        () => const SizedBox(),
        (mId) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: ref
              .watch(
                SP.mangaManager.select(
                  (m) => m
                      .map(
                        (m) => m.chapters.getOrNull(chapterIndex),
                      )
                      .toNullable(),
                ),
              )
              .fold(
                () => [],
                (chapter) => [
                  ...chapter.pageImages.indexed.map(
                    (pi) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: Row(
                        children: [
                          ImageWidget(
                            imageData: pi.$2.image,
                            mangaId: mId,
                            width: 64,
                            height: 64,
                            fit: BoxFit.cover,
                            radius: 8,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              pi.$2.image.name,
                              textAlign: TextAlign.start,
                              style: Styles.pr,
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (pi.$2.status != ImageDataStatus.none)
                            const CircularProgressIndicator()
                          else
                            IconButton(
                              onPressed: () => ref
                                  .read(SP.mangaManager.notifier)
                                  .removeChapterImage(
                                    chapterIndex,
                                    pi.$1,
                                  ),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  WidgetButton(
                    background: Styles.primary,
                    onTap: () => ref
                        .read(SP.mangaManager.notifier)
                        .addChapterImages(chapterIndex),
                    child: const Text(
                      'Добавить изображения',
                      style: Styles.pr,
                    ),
                  ),
                ],
              ),
        ),
      );
}
