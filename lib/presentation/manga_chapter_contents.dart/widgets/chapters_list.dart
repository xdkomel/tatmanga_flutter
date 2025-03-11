import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpdart/fpdart.dart';
import '../../../gen/assets.gen.dart';
import '../../common/image_widget.dart';
import '../../common/styles.dart';
import '../../common/text_editing_field.dart';
import '../../common/widget_button.dart';
import '../../models/image_data.dart';
import '../../models/manga_chapter.dart';
import '../../models/status_image_data.dart';
import '../../../providers.dart';

class ChaptersList extends ConsumerWidget {
  final int chapterIndex;

  const ChaptersList({required this.chapterIndex, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.read(SP.mangaManager).map((m) => m.mangaId).fold(
            () => const SizedBox(),
            (mId) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: ref
                  .watch(
                    SP.mangaManager.select(
                      (m) => m.flatMap(
                        (m) => Option.fromNullable(
                          m.chapters.getOrNull(chapterIndex),
                        ),
                      ),
                    ),
                  )
                  .fold(
                    () => [],
                    (chapter) => [
                      ...switch (chapter.images) {
                        MangaChapterImagesList mcil => mcil.images.indexed
                              .map<Widget>(
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
                                      switch (pi.$2.image) {
                                        FirebaseName fn => fn.name,
                                        UrlImage ui => ui.url,
                                      },
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
                                      icon: SvgPicture.asset(
                                        Assets.icons.delete,
                                        width: 24,
                                        height: 24,
                                        colorFilter: const ColorFilter.mode(
                                          Colors.redAccent,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          )
                              .followedBy(
                            [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: WidgetButton(
                                  background: Styles.primary,
                                  onTap: () => ref
                                      .read(SP.mangaManager.notifier)
                                      .addChapterImages(chapterIndex),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      ref
                                          .watch(SP.localizationManager)
                                          .translations
                                          .mangaChapterContents
                                          .addImages,
                                      style: Styles.pr,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        MangaChapterImagesStored mcis => [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _LinkInput(
                                    chapterIndex: chapterIndex,
                                    initialText: mcis.url,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    ref
                                        .watch(SP.localizationManager)
                                        .translations
                                        .mangaChapterContents
                                        .linkInputExplainText,
                                    style: Styles.pr,
                                  ),
                                ],
                              ),
                            ),
                          ],
                      },
                    ],
                  ),
            ),
          );
}

class _LinkInput extends ConsumerStatefulWidget {
  final int chapterIndex;
  final String? initialText;

  const _LinkInput({
    required this.initialText,
    required this.chapterIndex,
  });

  @override
  ConsumerState<_LinkInput> createState() => _LinkInputState();
}

class _LinkInputState extends ConsumerState<_LinkInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialText);
    _controller.addListener(_updateModel);
    super.initState();
  }

  void _updateModel() {
    final newName = _controller.text;
    ref.read(SP.mangaManager.notifier).setMangaLink(
          widget.chapterIndex,
          newName,
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextEditingField(
        controller: _controller,
        hintText: ref
            .watch(SP.localizationManager)
            .translations
            .mangaChapterContents
            .linkInputPlaceholder,
        style: Styles.pr,
      );
}
