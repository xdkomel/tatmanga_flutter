import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/page_body.dart';
import 'widgets/chapter_name.dart';
import 'widgets/chapters_list.dart';
import '../../providers.dart';

class MangaChapterContentsScreen extends ConsumerWidget {
  final int chapterIndex;

  const MangaChapterContentsScreen({required this.chapterIndex, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => PageBody(
        breadCrumbs: [
          BreadCrumb(
            name: ref
                .watch(SP.localizationManager)
                .translations
                .mangaList
                .library,
            navigate: () => Beamer.of(context).beamToNamed('/'),
          ),
          BreadCrumb(
            name: ref.read(SP.mangaManager).map((m) => m.title).toNullable() ??
                ref.watch(SP.localizationManager).translations.common.manga,
            navigate: Navigator.of(context).maybePop,
          ),
        ],
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: ChapterName(index: chapterIndex),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ChaptersList(chapterIndex: chapterIndex),
          ),
        ],
      );
}
