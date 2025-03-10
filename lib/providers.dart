import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'data/auth.dart';
import 'data/id_generator.dart';
import 'data/translations_builder.dart';
import 'domain/repositories/manga_content_repository.dart';
import 'domain/repositories/manga_content_repository_impl.dart';
import 'domain/repositories/manga_list_repository.dart';
import 'domain/repositories/manga_list_repository_impl.dart';
import 'presentation/common/authentication_manager.dart';
import 'presentation/common/editing_mode_on_manager.dart';
import 'presentation/common/localization_manager.dart';
import 'presentation/episode_images_view.dart/managers/episode_images_view_manager.dart';
import 'presentation/manga_contents/managers/manga_manager.dart';
import 'presentation/manga_list/managers/manga_loading_manager.dart';
import 'data/storage.dart';
import 'presentation/models/manga.dart';
import 'presentation/models/manga_chapter.dart';
import 'utils/env.dart';
import 'package:uuid/uuid.dart';

abstract class P {
  static final auth = Provider((_) => Auth());
  static final storage = Provider((_) => Storage());
  static final uuid = Provider((_) => const Uuid());
  static final idGenerator = Provider((red) => IdGenerator(red.read(uuid)));
  static final env = Provider((_) => Env());
  static final translationsBuilder = Provider((_) => TranslationsBuilder());
  static final mangaListRepository = Provider<MangaListRepository>(
    (ref) => MangaListRepositoryImpl(
      ref.read(storage),
      ref.read(idGenerator),
    ),
  );
  static final mangaContentRepository = Provider<MangaContentRepository>(
    (ref) => MangaContentRepositoryImpl(ref.read(storage)),
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
