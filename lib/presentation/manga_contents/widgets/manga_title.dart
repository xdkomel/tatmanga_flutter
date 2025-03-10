import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/styles.dart';
import '../../common/text_editing_field.dart';
import '../../../providers.dart';

class MangaTitle extends ConsumerWidget {
  const MangaTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(SP.mangaManager.select((m) => m.map((m) => m.title))).match(
            () => const SizedBox(),
            (title) => ref.watch(SP.editingModeOnManager)
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: _MangaTitleField(initialText: title),
                  )
                : Text(
                    title,
                    style: Styles.h2b,
                    textAlign: TextAlign.start,
                  ),
          );
}

class _MangaTitleField extends ConsumerStatefulWidget {
  const _MangaTitleField({required this.initialText});

  final String initialText;

  @override
  ConsumerState<_MangaTitleField> createState() => _MangaTitleFieldState();
}

class _MangaTitleFieldState extends ConsumerState<_MangaTitleField> {
  late final TextEditingController _controller;
  static const _debounceTag = 'title-field';

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialText);
    _controller.addListener(populateModel);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(populateModel);
    _controller.dispose();
    EasyDebounce.cancel(_debounceTag);
    super.dispose();
  }

  void populateModel() => EasyDebounce.debounce(
        _debounceTag,
        const Duration(milliseconds: 500),
        () => ref.read(SP.mangaManager.notifier).updateTitle(_controller.text),
      );

  @override
  Widget build(BuildContext context) => TextEditingField(
        controller: _controller,
        hintText: ref
            .watch(SP.localizationManager)
            .translations
            .mangaContents
            .mangaTitle,
        style: Styles.h2b,
      );
}
