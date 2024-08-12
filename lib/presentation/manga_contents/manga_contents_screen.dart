import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/page_body.dart';
import 'package:tatmanga_flutter/presentation/manga_contents/widgets/manga_authors.dart';
import 'package:tatmanga_flutter/presentation/manga_contents/widgets/manga_chapters.dart';
import 'package:tatmanga_flutter/presentation/manga_contents/widgets/manga_cover.dart';
import 'package:tatmanga_flutter/presentation/manga_contents/widgets/manga_description.dart';
import 'package:tatmanga_flutter/presentation/manga_contents/widgets/manga_title.dart';
import 'package:tatmanga_flutter/presentation/manga_contents/widgets/upload_config_button.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/fp.dart';
import 'package:tatmanga_flutter/utils/responsive_ui.dart';

class MangaContentsScreen extends ConsumerWidget {
  const MangaContentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (coverWidth, bodyWidth) = _coverAndTextWidth(context);
    return PageBody(
      breadCrumbs: [
        ref.watch(SP.localizationManager).translations.mangaList.library,
      ],
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              MangaCover(width: coverWidth),
              SizedBox(
                width: bodyWidth,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MangaTitle(),
                    MangaDesc(),
                    MangaAuthors(),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const UploadConfigButton(),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: const MangaChapters(),
        ),
      ],
    );
  }

  (double, double) _coverAndTextWidth(BuildContext context) {
    final width = contentWidth(context);
    return switch (width) {
      >= 756 => ((width - 56) / 3).let((one) => (one, one * 2)),
      _ => (width, width),
    };
  }
}
