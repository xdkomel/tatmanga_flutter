import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/presentation/common/image_widget.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/widget_button.dart';
import 'package:tatmanga_flutter/presentation/manga_contents/manga_contents_screen.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class MangaCard extends StatelessWidget {
  final Manga manga;
  final double width;

  const MangaCard({super.key, required this.manga, required this.width});

  @override
  Widget build(BuildContext context) => WidgetButton(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MangaContentsScreen(manga: manga),
          ),
        ),
        child: Right(
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  manga.cover.fold(
                    () => const SizedBox(),
                    (cover) => ImageWidget(
                      imageData: cover,
                      mangaId: manga.mangaId,
                      width: width - 16,
                      height: width - 16,
                      fit: BoxFit.cover,
                      radius: 4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(manga.title, style: Styles.h3b, textAlign: TextAlign.start),
                  const SizedBox(height: 2),
                  Text(
                    '${manga.chapters.length} эпизодов',
                    textAlign: TextAlign.start,
                    style: Styles.pr.copyWith(color: Styles.prime300),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
