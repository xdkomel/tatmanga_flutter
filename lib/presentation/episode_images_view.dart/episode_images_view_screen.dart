import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/image_widget.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

enum EpisodeImagesViewResponse { forward, back }

class EpisodeImagesViewScreen extends ConsumerStatefulWidget {
  final String mangaId;
  final bool startFromEnd;

  const EpisodeImagesViewScreen({
    super.key,
    required this.mangaId,
    required this.startFromEnd,
  });

  @override
  ConsumerState<EpisodeImagesViewScreen> createState() =>
      _EpisodeImagesViewScreenState();

  static Future<EpisodeImagesViewResponse?> show(
    BuildContext context,
    String mangaId,
    bool startFromEnd,
  ) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => EpisodeImagesViewScreen(
          mangaId: mangaId,
          startFromEnd: startFromEnd,
        ),
      );
}

class _EpisodeImagesViewScreenState
    extends ConsumerState<EpisodeImagesViewScreen> {
  final _controller = ScrollController();
  bool _showingControls = true;

  @override
  void initState() {
    HardwareKeyboard.instance.addHandler(_handle);
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _loadImages(),
    );
    super.initState();
  }

  Future<void> _loadImages() async {
    await ref.read(SP.episodeImagesViewManager.notifier).loadImages();
    if (widget.startFromEnd) {
      _scrollToEnd();
    }
  }

  void _scrollToEnd() => ref.read(SP.episodeImagesViewManager).map(
        (chapter) => switch (chapter.images) {
          MangaChapterImagesList list =>
            SchedulerBinding.instance.addPostFrameCallback(
              (_) => _controller.jumpTo(
                (list.images.length - 1) * MediaQuery.of(context).size.width,
              ),
            ),
          MangaChapterImagesStored _ => null,
        },
      );

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handle);
    _controller.dispose();
    super.dispose();
  }

  bool _handle(KeyEvent event) {
    if (event is! KeyDownEvent) {
      return true;
    }
    if (event.physicalKey == PhysicalKeyboardKey.arrowRight) {
      _moveForward();
    }
    if (event.physicalKey == PhysicalKeyboardKey.arrowLeft) {
      _moveBack();
    }
    return true;
  }

  void _moveForward() => ref.read(SP.episodeImagesViewManager).map(
        (chapter) => switch (chapter.images) {
          MangaChapterImagesList mcil => run(() {
              final maxOffset =
                  (mcil.images.length - 1) * MediaQuery.of(context).size.width;
              if (_controller.offset >= maxOffset) {
                Navigator.of(context).pop(EpisodeImagesViewResponse.forward);
                return;
              }
              _controller.animateTo(
                _controller.offset + MediaQuery.of(context).size.width,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              );
            }),
          _ => null,
        },
      );

  void _moveBack() => ref.read(SP.episodeImagesViewManager).map(
        (chapter) {
          if (_controller.offset <= 0) {
            Navigator.of(context).pop(EpisodeImagesViewResponse.back);
            return;
          }
          _controller.animateTo(
            _controller.offset - MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        },
      );

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
                        scrollDirection: Axis.horizontal,
                        physics: const PageScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        itemCount: list.images.length,
                        itemBuilder: (context, i) => SizedBox(
                          width: size.width,
                          height: size.height,
                          child: ImageWidget(
                            mangaId: widget.mangaId,
                            imageData: list.images[i].image,
                          ),
                        ),
                      ),
                    MangaChapterImagesStored stored when stored.loading =>
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    MangaChapterImagesStored stored => Text(
                        stored.errorMessage ?? 'Не удалось загрузить картинки',
                        style: Styles.h4b.copyWith(color: Colors.white),
                      ),
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
                Positioned.fill(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: _showingControls
                        ? Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: _moveBack,
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: _moveForward,
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
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
