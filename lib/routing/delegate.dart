import 'package:beamer/beamer.dart';
import 'package:tatmanga_flutter/presentation/homepage.dart';

import '../presentation/manga_contents/manga_contents_screen.dart';

final routerDelegate = BeamerDelegate(
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (context, state, data) => const HomePage(),
      '/manga/:mangaId': (context, state, data) {
        // final mangaId = state.pathParameters['mangaId']!;
        return const MangaContentsScreen();
      }
    },
  ).call,
);
