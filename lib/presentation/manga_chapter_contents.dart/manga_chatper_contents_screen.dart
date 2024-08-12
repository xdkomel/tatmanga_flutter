import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/page_body.dart';
import 'package:tatmanga_flutter/presentation/manga_chapter_contents.dart/widgets/chapter_name.dart';
import 'package:tatmanga_flutter/presentation/manga_chapter_contents.dart/widgets/chapters_list.dart';
import 'package:tatmanga_flutter/providers.dart';

class MangaChatperContentsScreen extends ConsumerWidget {
  final int chapterIndex;

  const MangaChatperContentsScreen({super.key, required this.chapterIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) => PageBody(
        breadCrumbs: [
          ref.watch(SP.localizationManager).translations.mangaList.library,
          ref.read(SP.mangaManager).map((m) => m.title).toNullable() ??
              ref.watch(SP.localizationManager).translations.common.manga,
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
