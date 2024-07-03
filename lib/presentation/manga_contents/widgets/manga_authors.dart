import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/text_editing_field.dart';
import 'package:tatmanga_flutter/presentation/common/widget_button.dart';
import 'package:tatmanga_flutter/providers.dart';

class MangaAuthors extends ConsumerWidget {
  const MangaAuthors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(SP.editingModeOnManager)
          ? const _AuthorsFields()
          : const _AuthorsWrap();
}

class _AuthorsWrap extends ConsumerWidget {
  const _AuthorsWrap();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref
          .watch(SP.mangaManager.select((m) => m.map((m) => m.authors)))
          .map(
            (authors) => Wrap(
              spacing: 16,
              children: authors
                  .map(
                    (ad) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          ad.role,
                          style: Styles.h4b.copyWith(
                            color: Styles.prime500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(ad.name, style: Styles.pr),
                      ],
                    ),
                  )
                  .toList(),
            ),
          )
          .toNullable() ??
      const SizedBox();
}

class _AuthorsFields extends ConsumerWidget {
  const _AuthorsFields();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref
          .watch(SP.mangaManager.select((m) => m.map((m) => m.authors)))
          .map(
            (authors) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...authors.indexed.expand(
                  (ad) => [
                    _NameRole(
                      key: ObjectKey(ad.$2.id),
                      index: ad.$1,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
                WidgetButton(
                  onTap: ref.read(SP.mangaManager.notifier).addAuthor,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 4),
                        Text('Добавить автора'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
          .toNullable() ??
      const SizedBox();
}

class _NameRole extends ConsumerStatefulWidget {
  final int index;
  const _NameRole({super.key, required this.index});

  @override
  ConsumerState<_NameRole> createState() => _NameRoleState();
}

class _NameRoleState extends ConsumerState<_NameRole> {
  late final TextEditingController _controller1;
  late final TextEditingController _controller2;
  late final String _titleTag;
  late final String _descTag;

  @override
  void initState() {
    _titleTag = 'authors-name-${widget.index}';
    _descTag = 'authors-desc-${widget.index}';
    _controller1 = TextEditingController(
      text: ref
          .read(SP.mangaManager)
          .map(
            (m) => m.authors.getOrNull(widget.index)?.name,
          )
          .toNullable(),
    );
    _controller1.addListener(_populateName);
    _controller2 = TextEditingController(
      text: ref
          .read(SP.mangaManager)
          .map(
            (m) => m.authors.getOrNull(widget.index)?.role,
          )
          .toNullable(),
    );
    _controller2.addListener(_populateDesc);
    super.initState();
  }

  @override
  void dispose() {
    _controller1.removeListener(_populateName);
    _controller2.removeListener(_populateDesc);
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  void _populateName() => EasyDebounce.debounce(
        _titleTag,
        const Duration(milliseconds: 500),
        () => ref.read(SP.mangaManager.notifier).updateAuthorName(
              widget.index,
              _controller1.text,
            ),
      );

  void _populateDesc() => EasyDebounce.debounce(
        _descTag,
        const Duration(milliseconds: 500),
        () => ref.read(SP.mangaManager.notifier).updateAuthorRole(
              widget.index,
              _controller2.text,
            ),
      );

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: TextEditingField(
              controller: _controller1,
              hintText: 'Имя',
              style: Styles.pb,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextEditingField(
              controller: _controller2,
              hintText: 'Роль',
              style: Styles.pr,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () =>
                ref.read(SP.mangaManager.notifier).removeAuthor(widget.index),
            icon: const Icon(Icons.delete),
          ),
        ],
      );
}
