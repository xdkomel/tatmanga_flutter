import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/text_editing_field.dart';
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
  Widget build(BuildContext context) => TextEditingField(
        controller: _controller,
        hintText: ref
            .watch(SP.localizationManager)
            .translations
            .mangaChapterContents
            .episodeName,
        style: Styles.pb,
      );
}
