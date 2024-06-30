import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:tatmanga_flutter/presentation/common/image_widget.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/widget_button.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';

class EpisodeImagesViewScreen extends StatefulWidget {
  final String mangaId;
  final MangaChapter chapter;

  const EpisodeImagesViewScreen({
    super.key,
    required this.chapter,
    required this.mangaId,
  });

  @override
  State<EpisodeImagesViewScreen> createState() => _EpisodeImagesViewScreenState();
}

class _EpisodeImagesViewScreenState extends State<EpisodeImagesViewScreen> {
  final _controller = ScrollController();
  bool _showingControls = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => setState(() => _showingControls = !_showingControls),
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemCount: widget.chapter.pageImages.length,
              itemBuilder: (context, i) => SizedBox(
                width: size.width,
                height: size.height,
                child: ImageWidget(
                  mangaId: widget.mangaId,
                  imageData: widget.chapter.pageImages[i].image,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _showingControls ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    WidgetButton(
                      child: Right(
                        Text(
                          'Закрыть',
                          style: Styles.pr.copyWith(color: Colors.white),
                        ),
                      ),
                      onTap: Navigator.of(context).pop,
                    ),
                    const Spacer(),
                    WidgetButton(
                      child: const Right(
                        Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () => _controller.animateTo(
                        _controller.offset - size.width,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                      ),
                    ),
                    const SizedBox(width: 16),
                    WidgetButton(
                      child: const Right(
                        Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () => _controller.animateTo(
                        _controller.offset + size.width,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
