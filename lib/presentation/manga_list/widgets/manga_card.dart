import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/image_widget.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/widget_button.dart';
import 'package:tatmanga_flutter/presentation/manga_contents/manga_contents_screen.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class MangaCard extends ConsumerWidget {
  final Manga manga;
  final double width;

  const MangaCard({
    super.key,
    required this.manga,
    required this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => Stack(
        children: [
          WidgetButton(
            onTap: () => _openManga(ref, context),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: width - 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    manga.cover.fold(
                      () => const SizedBox(),
                      (cover) => ImageWidget(
                        imageData: cover.image,
                        mangaId: manga.mangaId,
                        width: width - 32,
                        height: width - 32,
                        fit: BoxFit.cover,
                        radius: 4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(manga.title,
                        style: Styles.h3b, textAlign: TextAlign.start),
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
          // _RemoveButton(mangaId: manga.mangaId),
        ],
      );

  Future<void> _openManga(WidgetRef ref, BuildContext context) =>
      ref.read(SP.mangaManager).fold(
        () async {
          final manager = ref.read(SP.mangaManager.notifier);
          manager.setModel(manga);
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const MangaContentsScreen(),
            ),
          );
          ref.read(SP.mangaManager).map(
                ref.read(SP.mangaLoadingManager.notifier).updateManga,
              );
          await manager.uploadConfig();
          manager.removeModel();
        },
        (_) => Future.value(),
      );
}

// class _RemoveButton extends ConsumerWidget {
//   final String mangaId;

//   const _RemoveButton({required this.mangaId});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) =>
//       ref.watch(SP.editingModeOnManager)
//           ? Positioned(
//               top: 8,
//               right: 8,
//               child: IconButton(
//                 onPressed: () => ref
//                     .read(SP.mangaLoadingManager.notifier)
//                     .removeManga(mangaId),
//                 icon: const Icon(
//                   Icons.delete,
//                   color: Colors.redAccent,
//                 ),
//               ),
//             )
//           : const SizedBox();
// }
