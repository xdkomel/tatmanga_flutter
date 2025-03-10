import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/page_body.dart';
import '../manga_list/managers/manga_loading_manager.dart';
import 'managers/manga_manager.dart';
import 'widgets/manga_authors.dart';
import 'widgets/manga_chapters.dart';
import 'widgets/manga_cover.dart';
import 'widgets/manga_description.dart';
import 'widgets/manga_title.dart';
import 'widgets/upload_config_button.dart';
import '../../providers.dart';
import '../../utils/fp.dart';
import '../../utils/responsive_ui.dart';

class MangaContentsScreen extends ConsumerStatefulWidget {
  const MangaContentsScreen({required this.mangaId, super.key});

  final String mangaId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MangaContentsScreenState();
}

class _MangaContentsScreenState extends ConsumerState<MangaContentsScreen> {
  _MangaContentsScreenState();

  late final MangaManager _mangaManager;
  late final MangaLoadingManager _mangaLoadingManager;

  @override
  void initState() {
    _mangaManager = ref.read(SP.mangaManager.notifier);
    _mangaLoadingManager = ref.read(SP.mangaLoadingManager.notifier);
    _mangaManager.loadModel(widget.mangaId);
    super.initState();
  }

  @override
  void dispose() {
    Future(_uploadLastChanges);
    super.dispose();
  }

  Future<void> _uploadLastChanges() async {
    _mangaLoadingManager.updateManga();
    await _mangaManager.uploadConfig();
    _mangaManager.removeModel();
  }

  @override
  Widget build(BuildContext context) {
    final (coverWidth, bodyWidth) = _coverAndTextWidth(context);
    return PageBody(
      breadCrumbs: [
        BreadCrumb(
          name:
              ref.watch(SP.localizationManager).translations.mangaList.library,
          navigate: () => Beamer.of(context).beamToNamed('/'),
        ),
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
