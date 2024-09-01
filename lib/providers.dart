import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/data/auth.dart';
import 'package:tatmanga_flutter/data/telegraph.dart';
import 'package:tatmanga_flutter/data/translations_builder.dart';
import 'package:tatmanga_flutter/domain/repositories/manga_chapter_images_repository.dart';
import 'package:tatmanga_flutter/domain/repositories/manga_chapter_images_repository_impl.dart';
import 'package:tatmanga_flutter/domain/repositories/manga_content_repository.dart';
import 'package:tatmanga_flutter/domain/repositories/manga_content_repository_impl.dart';
import 'package:tatmanga_flutter/domain/repositories/manga_list_repository.dart';
import 'package:tatmanga_flutter/domain/repositories/manga_list_repository_impl.dart';
import 'package:tatmanga_flutter/presentation/common/authentication_manager.dart';
import 'package:tatmanga_flutter/presentation/common/editing_mode_on_manager.dart';
import 'package:tatmanga_flutter/presentation/common/localization_manager.dart';
import 'package:tatmanga_flutter/presentation/episode_images_view.dart/managers/episode_images_view_manager.dart';
import 'package:tatmanga_flutter/presentation/manga_contents/managers/manga_manager.dart';
import 'package:tatmanga_flutter/presentation/manga_list/managers/manga_loading_manager.dart';
import 'package:tatmanga_flutter/data/storage.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';
import 'package:tatmanga_flutter/utils/env.dart';
import 'package:uuid/uuid.dart';

abstract class P {
  static final auth = Provider((_) => Auth());
  static final storage = Provider((_) => Storage());
  static final uuid = Provider((_) => const Uuid());
  static final env = Provider((_) => Env());
  static final translationsBuilder = Provider((_) => TranslationsBuilder());
  static final fluroRouter = Provider((_) => FluroRouter());
  static final telegraph = Provider((_) => Telegraph());
  static final mangaListRepository = Provider<MangaListRepository>(
    (ref) => MangaListRepositoryImpl(
      ref.read(storage),
      ref.read(uuid),
    ),
  );
  static final mangaContentRepository = Provider<MangaContentRepository>(
    (ref) => MangaContentRepositoryImpl(ref.read(storage)),
  );
  static final mangaChapterImagesRepository =
      Provider<MangaChapterImagesRepository>(
    (ref) => MangaChapterImagesRepositoryImpl(ref.read(telegraph)),
  );
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
  static final localizationManager =
      NotifierProvider<LocalizationManager, LocalizationState>(
    LocalizationManager.new,
  );
}
