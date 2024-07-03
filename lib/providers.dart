import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/data/auth.dart';
import 'package:tatmanga_flutter/presentation/common/authentication_manager.dart';
import 'package:tatmanga_flutter/presentation/common/editing_mode_on_manager.dart';
import 'package:tatmanga_flutter/presentation/episode_images_view.dart/managers/episode_images_view_manager.dart';
import 'package:tatmanga_flutter/presentation/manga_contents/managers/manga_manager.dart';
import 'package:tatmanga_flutter/presentation/manga_list/managers/manga_loading_manager.dart';
import 'package:tatmanga_flutter/data/storage.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';
import 'package:uuid/uuid.dart';

abstract class P {
  static final auth = Provider((_) => Auth());
  static final storage = Provider((_) => Storage());
  static final uuid = Provider((_) => const Uuid());
}

abstract class SP {
  static final mangaLoadingManager =
      NotifierProvider<MangaLoadingManager, Option<IList<Manga>>>(
    MangaLoadingManager.new,
  );
  static final authenticationManager =
      NotifierProvider<AuthenticationManager, Option<AuthData>>(
    AuthenticationManager.new,
  );
  static final editingModeOnManager =
      NotifierProvider<EditingModeOnManager, bool>(
    EditingModeOnManager.new,
  );
  static final mangaManager = NotifierProvider<MangaManager, Option<Manga>>(
    MangaManager.new,
  );
  static final episodeImagesViewManager =
      NotifierProvider<EpisodeImagesViewManager, Option<MangaChapter>>(
    EpisodeImagesViewManager.new,
  );
}
