import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/presentation/common/image_widget.dart';
import 'package:tatmanga_flutter/presentation/common/page_body.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/widget_button.dart';
import 'package:tatmanga_flutter/presentation/episode_images_view.dart/episode_images_view_screen.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/utils/fp.dart';
import 'package:tatmanga_flutter/utils/responsive_ui.dart';

class MangaContentsScreen extends StatelessWidget {
  final Manga manga;

  const MangaContentsScreen({super.key, required this.manga});

  @override
  Widget build(BuildContext context) {
    final (coverWidth, bodyWidth) = _coverAndTextWidth(context);
    return PageBody(
      breadCrumbs: const ['Библиотека'],
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
              ...manga.cover.fold(
                () => [],
                (cover) => [
                  ImageWidget(
                    imageData: cover,
                    mangaId: manga.mangaId,
                    width: coverWidth,
                  ),
                ],
              ),
              SizedBox(
                width: bodyWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      manga.title,
                      style: Styles.h2b,
                      textAlign: TextAlign.start,
                    ),
                    ...manga.description.fold(
                      () => [],
                      (d) => [
                        const SizedBox(height: 16),
                        Text(
                          d,
                          style: Styles.pr,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: manga.chapters.indexed
                .expand(
                  (ch) => [
                    WidgetButton(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EpisodeImagesViewScreen(
                            chapter: ch.$2,
                            mangaId: manga.mangaId,
                          ),
                        ),
                      ),
                      borderRadius: 0,
                      child: Right(
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${ch.$1}',
                                    style: Styles.pb.copyWith(color: Styles.prime012),
                                  ),
                                ),
                              ),
                              Text(
                                ch.$2.name ?? 'Глава ${ch.$1}',
                                style: Styles.pr.copyWith(color: Styles.prime200),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(height: 1),
                  ],
                )
                .toList(),
          ),
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
