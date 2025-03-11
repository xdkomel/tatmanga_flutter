import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

import '../presentation/episode_images_view.dart/episode_images_view_screen.dart';
import '../presentation/manga_contents/manga_contents_screen.dart';
import '../presentation/manga_list/manga_list_screen.dart';
import '../presentation/not_found/not_found_screen.dart';

final routerDelegate = BeamerDelegate(
  transitionDelegate: const NoAnimationTransitionDelegate(),
  notFoundPage: const BeamPage(
    key: ObjectKey('not-found-page'),
    title: '404',
    child: NotFoundScreen(),
  ),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (context, state, data) => const BeamPage(
            key: ObjectKey('manga-list-screen'),
            title: 'Tatmanga',
            child: MangaListScreen(),
          ),
      '/manga/:mangaId': (context, state, data) {
        final mangaId = state.pathParameters['mangaId'];
        if (mangaId == null) {
          return BeamPage.notFound;
        }
        return BeamPage(
          key: ObjectKey(mangaId),
          title: 'Manga $mangaId',
          child: MangaContentsScreen(
            mangaId: mangaId,
          ),
        );
      },
      '/manga/:mangaId/:chapterIndex': (context, state, data) {
        final mangaId = state.pathParameters['mangaId'];
        final chapterIndex =
            int.tryParse(state.pathParameters['chapterIndex']!);
        if (mangaId == null || chapterIndex == null) {
          return BeamPage.notFound;
        }
        return BeamPage(
          key: ObjectKey((mangaId, chapterIndex, 'view')),
          title: 'Manga Chapter $chapterIndex',
          child: EpisodeImagesViewScreen(
            mangaId: mangaId,
            chapterIndex: chapterIndex - 1,
          ),
        );
      }
    },
  ).call,
);
