import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/domain/models/manga_config.dart';
import 'package:tatmanga_flutter/presentation/common/image_data.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class MangaLoadingManager extends Notifier<Option<List<Manga>>> {
  @override
  Option<List<Manga>> build() => const None();

  Future<void> loadManga() async {
    final configs = await ref.read(P.storage).downloadConfigs();
    state = Some(configs.map(_toManga).toList());
  }

  Manga _toManga(MangaConfig config) => Manga(
        mangaId: config.mangaId,
        title: config.title,
        description: config.description,
        cover: config.coverName.map(NamedImage.new),
        authors: config.authors,
        chapters: config.chapters
            .map(
              (ch) => MangaChapter(
                name: ch.name,
                pageImages: ch.filesNames
                    .map(
                      (fn) => StatusImageData(
                        status: ImageDataStatus.none,
                        image: NamedImage(fn),
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      );

  
}


// extension on FirebaseManga {
//   Future<Manga> toManga(Reference r) async {
//     final url = Storage.urlById(r);
//     final coverUrl = await coverId.fold(
//       () => Future.value(),
//       (cu) => url(cu),
//     );
//     final chs = await chapters
//         .map(
//           (fc) async => MangaChapter(
//             name: fc.name,
//             pageUrls: await fc.filesNames.map(url).wait,
//           ),
//         )
//         .wait;
//     return Manga(
//       title: title,
//       description: description,
//       coverUrl: coverUrl,
//       chapters: chs,
//     );
//   }
// }