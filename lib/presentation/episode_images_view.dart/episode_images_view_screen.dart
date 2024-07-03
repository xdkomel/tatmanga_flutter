import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/image_widget.dart';
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
  MangaChapter? _chapter;

  @override
  void initState() {
    _chapter = ref.read(SP.episodeImagesViewManager).toNullable();
    HardwareKeyboard.instance.addHandler(_handle);
    _chapter.map((chapter) {
      if (widget.startFromEnd) {
        SchedulerBinding.instance.addPostFrameCallback(
          (_) => _controller.jumpTo(
            (chapter.pageImages.length - 1) * MediaQuery.of(context).size.width,
          ),
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handle);
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

  void _moveForward() => _chapter.map(
        (chapter) {
          final maxOffset = (chapter.pageImages.length - 1) *
              MediaQuery.of(context).size.width;
          if (_controller.offset >= maxOffset) {
            Navigator.of(context).pop(EpisodeImagesViewResponse.forward);
            return;
          }
          _controller.animateTo(
            _controller.offset + MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        },
      );

  void _moveBack() => _chapter.map(
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
                  child: ListView.builder(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    itemCount: chapter.pageImages.length,
                    itemBuilder: (context, i) => SizedBox(
                      width: size.width,
                      height: size.height,
                      child: ImageWidget(
                        mangaId: widget.mangaId,
                        imageData: chapter.pageImages[i].image,
                      ),
                    ),
                  ),
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
