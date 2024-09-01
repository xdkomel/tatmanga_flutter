import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/text_editing_field.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';
import 'package:tatmanga_flutter/providers.dart';

class ChapterName extends ConsumerStatefulWidget {
  final int index;
  const ChapterName({super.key, required this.index});

  @override
  ConsumerState<ChapterName> createState() => _ChapterNameState();
}

class _ChapterNameState extends ConsumerState<ChapterName> {
  static const _tag = 'chapter-name-field';
  late final TextEditingController _controller;

  @override
  void initState() {
    final initText = ref
        .read(SP.mangaManager)
        .map((m) => m.chapters.getOrNull(widget.index)?.name)
        .toNullable();
    _controller = TextEditingController(text: initText);
    _controller.addListener(_updateModel);
    super.initState();
  }

  void _updateModel() => EasyDebounce.debounce(
        _tag,
        const Duration(milliseconds: 500),
        () => ref.read(SP.mangaManager.notifier).updateChapterName(
              widget.index,
              _controller.text,
            ),
      );

  @override
  void dispose() {
    _controller.removeListener(_updateModel);
    _controller.dispose();
    EasyDebounce.cancel(_tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextEditingField(
          controller: _controller,
          hintText: ref
              .watch(SP.localizationManager)
              .translations
              .mangaChapterContents
              .episodeName,
          style: Styles.pb,
        ),
        const SizedBox(height: 16),
        const Text('Способ загрузки изображений', style: Styles.h3b),
        const SizedBox(height: 8),
        _ImagesProviderSelector(index: widget.index),
      ],
    );
  }
}

class _ImagesProviderSelector extends ConsumerWidget {
  final int index;

  const _ImagesProviderSelector({required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useTelegraphParsing = switch (ref.watch(
      SP.mangaManager.select(
        (manga) => manga
            .map(
              (m) => m.chapters.getOrNull(index)?.images,
            )
            .toNullable(),
      ),
    )) {
      MangaChapterImagesStored _ => true,
      _ => false,
    };
    return Column(
      children: [
        GestureDetector(
          onTap: () => ref
              .read(SP.mangaManager.notifier)
              .setTelegraphParsingUsage(index, true),
          child: Row(
            children: [
              Radio(
                value: true,
                groupValue: useTelegraphParsing,
                onChanged: null,
              ),
              const Text('Парсить картинки из Telegraph'),
            ],
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => ref
              .read(SP.mangaManager.notifier)
              .setTelegraphParsingUsage(index, false),
          child: Row(
            children: [
              Radio(
                value: false,
                groupValue: useTelegraphParsing,
                onChanged: null,
              ),
              const Text('Загрузить собственные'),
            ],
          ),
        ),
      ],
    );
  }
}
