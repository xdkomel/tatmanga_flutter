import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../common/image_widget.dart';
import '../models/manga_chapter.dart';
import '../../providers.dart';

enum EpisodeImagesViewResponse { forward, back }

class EpisodeImagesViewScreen extends ConsumerStatefulWidget {
  final String mangaId;
  final int chapterIndex;

  const EpisodeImagesViewScreen({
    required this.mangaId,
    required this.chapterIndex,
    super.key,
  });

  @override
  ConsumerState<EpisodeImagesViewScreen> createState() =>
      _EpisodeImagesViewScreenState();
}

class _EpisodeImagesViewScreenState
    extends ConsumerState<EpisodeImagesViewScreen> {
  final _controller = ScrollController();
  bool _showingControls = true;
  late final _episodeImagesManager = ref.read(
    SP.episodeImagesViewManager.notifier,
  );

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _loadModel(),
    );
    super.initState();
  }

  Future<void> _loadModel() async {
    await _episodeImagesManager.loadModel(widget.mangaId, widget.chapterIndex);
    ref.read(SP.episodeImagesViewManager).map((mc) {
      if (mc.images case MangaChapterImagesStored(:final url)) {
        if (url != null) {
          launchUrl(Uri.parse(url));
        }
        Beamer.of(context).popRoute();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    Future(_episodeImagesManager.removeModel);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ref.watch(SP.episodeImagesViewManager).fold(
            () => const SizedBox(),
            (chapter) => Stack(
              children: [
                GestureDetector(
                  onTap: () => setState(
                    () => _showingControls = !_showingControls,
                  ),
                  child: switch (chapter.images) {
                    MangaChapterImagesList list => ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(),
                        itemCount: list.images.length,
                        itemBuilder: (context, i) => SizedBox(
                          width: size.width,
                          child: ImageWidget(
                            mangaId: widget.mangaId,
                            imageData: list.images[i].image,
                          ),
                        ),
                      ),
                    MangaChapterImagesStored() => const SizedBox(),
                  },
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: _showingControls
                        ? IconButton(
                            onPressed: Navigator.of(context).pop,
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          )
                        : null,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
