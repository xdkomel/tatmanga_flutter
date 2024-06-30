import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/data/auth.dart';
import 'package:tatmanga_flutter/presentation/add_manga/managers/editing_manga_manager.dart';
import 'package:tatmanga_flutter/presentation/common/authentication_manager.dart';
import 'package:tatmanga_flutter/presentation/common/editing_manager.dart';
import 'package:tatmanga_flutter/presentation/manga_list/managers/manga_loading_manager.dart';
import 'package:tatmanga_flutter/presentation/models/editing_manga_model.dart';
import 'package:tatmanga_flutter/data/storage.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';

abstract class P {
  static final auth = Provider((_) => Auth());
  static final storage = Provider((_) => Storage());
}

abstract class SP {
  static final editingMangaManager = NotifierProvider<EditingMangaManager, Option<EditingMangaModel>>(
    () => EditingMangaManager(),
  );
  static final mangaLoadingManager = NotifierProvider<MangaLoadingManager, Option<List<Manga>>>(
    () => MangaLoadingManager(),
  );
  static final authenticationManager = NotifierProvider<AuthenticationManager, Option<AuthData>>(
    () => AuthenticationManager(),
  );
  static final editingModeOnManager = NotifierProvider<EditingModeOnManager, bool>(
    () => EditingModeOnManager(),
  );
}
