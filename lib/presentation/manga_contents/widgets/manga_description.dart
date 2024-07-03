import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/text_editing_field.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class MangaDesc extends ConsumerWidget {
  const MangaDesc({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => ref
          .watch(SP.editingModeOnManager)
      ? const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: _MangaDescField(),
        )
      : ref
              .watch(SP.mangaManager.select((m) => m.map((m) => m.description)))
              .map(
                (desc) => desc.map(
                  (desc) => Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      desc,
                      style: Styles.pr,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              )
              .toNullable() ??
          const SizedBox();
}

class _MangaDescField extends ConsumerStatefulWidget {
  const _MangaDescField();

  @override
  ConsumerState<_MangaDescField> createState() => _MangaDescFieldState();
}

class _MangaDescFieldState extends ConsumerState<_MangaDescField> {
  late final TextEditingController _controller;
  static const _debounceTag = 'desc-field';

  @override
  void initState() {
    _controller = TextEditingController(
      text: ref.read(SP.mangaManager).map((m) => m.description).toNullable(),
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
        () => ref
            .read(SP.mangaManager.notifier)
            .updateDescription(_controller.text),
      );

  @override
  Widget build(BuildContext context) => TextEditingField(
        controller: _controller,
        hintText: 'Описание',
        style: Styles.pr,
      );
}
