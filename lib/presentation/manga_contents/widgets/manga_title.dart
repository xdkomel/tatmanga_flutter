import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/text_editing_field.dart';
import 'package:tatmanga_flutter/providers.dart';

class MangaTitle extends ConsumerWidget {
  const MangaTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(SP.editingModeOnManager)
          ? const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: _MangaTitleField(),
            )
          : const _Title();
}

class _Title extends ConsumerWidget {
  const _Title();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref
          .watch(SP.mangaManager.select((m) => m.map((m) => m.title)))
          .map(
            (title) => Text(
              title,
              style: Styles.h2b,
              textAlign: TextAlign.start,
            ),
          )
          .toNullable() ??
      const SizedBox();
}

class _MangaTitleField extends ConsumerStatefulWidget {
  const _MangaTitleField();

  @override
  ConsumerState<_MangaTitleField> createState() => _MangaTitleFieldState();
}

class _MangaTitleFieldState extends ConsumerState<_MangaTitleField> {
  late final TextEditingController _controller;
  static const _debounceTag = 'title-field';

  @override
  void initState() {
    _controller = TextEditingController(
      text: ref.read(SP.mangaManager).map((m) => m.title).toNullable(),
    );
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
        hintText: 'Название',
        style: Styles.h2b,
      );
}
