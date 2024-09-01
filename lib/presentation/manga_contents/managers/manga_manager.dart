import 'dart:typed_data';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/presentation/models/image_data.dart';
import 'package:tatmanga_flutter/presentation/models/author.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/presentation/models/manga_chapter.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class MangaManager extends Notifier<Option<Manga>> {
  bool _changed = false;
  static const _debouncerTag = 'manga-manager-debounce';

  @override
  Option<Manga> build() => const None();

  void removeModel() => state = const None();

  void setModel(Manga model) => state = Some(model);

  void _debounceUpdate() {
    _changed = true;
    EasyDebounce.debounce(
      _debouncerTag,
      const Duration(seconds: 10),
      uploadConfig,
    );
  }

  Future<void> _withState(Future<void> Function(Manga) f) =>
      state.fold(Future.value, f);

  void updateTitle(String title) {
    _debounceUpdate();
    state.map(
      (manga) => setModel(manga.copyWith(title: title)),
    );
  }

  void updateDescription(String description) {
    _debounceUpdate();
    state.map(
      (manga) => setModel(manga.copyWith(description: description)),
    );
  }

  void updateAuthorName(int index, String name) {
    state.map(
      (manga) => setModel(
        manga.copyWith(
          authors: manga.authors.replace(
            index,
            manga.authors.get(index).copyWith(name: name),
          ),
        ),
      ),
    );
  }

  void updateAuthorRole(int index, String role) {
    _debounceUpdate();
    state.map(
      (manga) => setModel(
        manga.copyWith(
          authors: manga.authors.replace(
            index,
            manga.authors.get(index).copyWith(role: role),
          ),
        ),
      ),
    );
  }

  void removeAuthor(int index) {
    _debounceUpdate();
    state.map(
      (manga) => setModel(
        manga.copyWith(
          authors: manga.authors.removeAt(index),
        ),
      ),
    );
  }

  void addAuthor() {
    _debounceUpdate();
    state.map(
      (manga) => setModel(
        manga.copyWith(
          authors: manga.authors.add(
            Author(
              id: ref.read(P.uuid).v4(),
              name: '',
              role: '',
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadConfig() =>
      _changed ? _withState(_uploadConfig) : Future.value();

  Future<void> _uploadConfig(Manga model) async {
    setModel(model.copyWith(configUploading: true));
    await ref.read(P.mangaContentRepository).uploadConfig(model);
    setModel(model.copyWith(configUploading: false));
    _changed = false;
  }

  Future<void> removeCoverImage() {
    _debounceUpdate();
    return _withState(_removeCover);
  }

  Future<void> _removeCover(Manga manga) async {
    setModel(
      manga.copyWith(
        cover: manga.cover?.copyWith(status: ImageDataStatus.deleting),
      ),
    );
    await switch (manga.cover?.image) {
      FirebaseName fn => _removeImage(manga.mangaId, fn.name),
      _ => Future.value()
    };
    setModel(manga.copyWith(cover: null));
  }

  Future<void> uploadCoverImage() {
    _debounceUpdate();
    return _withState(_uploadCover);
  }

  Future<void> _uploadCover(Manga model) async {
    final file = await FilePicker.platform.pickFiles();
    await (file?.files.firstOrNull).map(
      (f) => f.bytes.map(
        (bytes) async {
          final name = ref.read(P.uuid).v4();
          _setCover(name, bytes);
          await _uploadImage(model.mangaId, name, bytes);
          _markCoverLoaded();
        },
      ),
    );
  }

  void _setCover(String fileName, Uint8List bytes) => state.map(
        (model) => setModel(
          model.copyWith(
            cover: StatusImageData(
              status: ImageDataStatus.uploading,
              image: BytesImage(fileName, bytes),
            ),
          ),
        ),
      );

  void _markCoverLoaded() => state.map(
        (model) => setModel(model.copyWith(
          cover: model.cover?.copyWith(
            status: ImageDataStatus.none,
          ),
        )),
      );

  void setLinkCover(String url) {
    _debounceUpdate();
    state.map(
      (model) => setModel(
        model.copyWith(
          cover: StatusImageData(
            status: ImageDataStatus.none,
            image: UrlImage(url),
          ),
        ),
      ),
    );
  }

  Future<void> _uploadImage(String mangaId, String fileName, Uint8List bytes) =>
      ref.read(P.mangaContentRepository).uploadImage(mangaId, fileName, bytes);

  Future<void> _removeImage(String mangaId, String fileName) =>
      ref.read(P.mangaContentRepository).removeImage(mangaId, fileName);

  Future<void> addChapterImages(int eposodeIndex) {
    _debounceUpdate();
    return _withState(
      (a) => _addImages(a, eposodeIndex),
    );
  }

  Future<void> _addImages(Manga model, int eposodeIndex) async {
    final files = await FilePicker.platform.pickFiles(allowMultiple: true);
    await files.map(
      (fs) => fs.files
          .map(
            (f) => f.bytes.map((b) => (ref.read(P.uuid).v4(), b)),
          )
          .nonNulls
          .map(
            (data) {
              final index = _addLoadingImage(eposodeIndex, data.$1, data.$2);
              return index.map((index) async {
                await _uploadImage(model.mangaId, data.$1, data.$2);
                _markImageLoaded(eposodeIndex, index);
              });
            },
          )
          .nonNulls
          .wait,
    );
  }

  int? _addLoadingImage(int eposodeIndex, String fileName, Uint8List bytes) =>
      state
          .map(
            (model) => model.chapters.getOrNull(eposodeIndex).map(
              (episode) {
                final (newMangaChapterImages, index) = switch (episode.images) {
                  MangaChapterImagesList list => (
                      MangaChapterImages.list(
                        images: list.images.add(
                          StatusImageData(
                            image: BytesImage(fileName, bytes),
                            status: ImageDataStatus.uploading,
                          ),
                        ),
                      ),
                      list.images.length,
                    ),
                  _ => (episode.images, null),
                };
                setModel(
                  model.copyWith(
                    chapters: model.chapters.replace(
                      eposodeIndex,
                      episode.copyWith(images: newMangaChapterImages),
                    ),
                  ),
                );
                return index;
              },
            ),
          )
          .toNullable();

  void _markImageLoaded(int eposodeIndex, int index) => state.map(
        (model) => model.chapters.getOrNull(eposodeIndex).map(
              (episode) => setModel(
                model.copyWith(
                  chapters: model.chapters.replace(
                    eposodeIndex,
                    episode.copyWith(
                      images: switch (episode.images) {
                        MangaChapterImagesList mcil => MangaChapterImages.list(
                            images: mcil.images.replace(
                              index,
                              StatusImageData(
                                image: mcil.images.get(index).image,
                                status: ImageDataStatus.none,
                              ),
                            ),
                          ),
                        _ => episode.images,
                      },
                    ),
                  ),
                ),
              ),
            ),
      );

  Future<void> removeChapterImage(int chapterIndex, int imageIndex) {
    _debounceUpdate();
    return _removeChapterImage(chapterIndex, imageIndex, true);
  }

  Future<void> _removeChapterImage(
    int chapterIndex,
    int imageIndex,
    bool emitUpdates,
  ) =>
      state
          .map(
            (model) => model.chapters.getOrNull(chapterIndex).map(
                  (chapter) => switch (chapter.images) {
                    MangaChapterImagesList list =>
                      list.images.getOrNull(imageIndex).map(
                        (img) async {
                          if (emitUpdates) {
                            setModel(
                              model.copyWith(
                                chapters: model.chapters.replace(
                                  chapterIndex,
                                  chapter.copyWith(
                                    images: MangaChapterImages.list(
                                      images: list.images.replace(
                                        imageIndex,
                                        img.copyWith(
                                          status: ImageDataStatus.deleting,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          await switch (img.image) {
                            FirebaseName fn => _removeImage(
                                model.mangaId,
                                fn.name,
                              ),
                            _ => Future.value(),
                          };
                          if (emitUpdates) {
                            setModel(
                              model.copyWith(
                                chapters: model.chapters.replace(
                                  chapterIndex,
                                  chapter.copyWith(
                                    images: MangaChapterImages.list(
                                      images: list.images.removeAt(imageIndex),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    _ => null,
                  },
                ),
          )
          .toNullable() ??
      Future.value();

  Future<void> removeChapter(int index) {
    _debounceUpdate();
    return state
            .map(
              (model) => model.chapters.getOrNull(index).map(
                (chapter) async {
                  await switch (chapter.images) {
                    MangaChapterImagesList list => list.images.indexed
                        .map((e) => _removeChapterImage(index, e.$1, false))
                        .wait,
                    _ => Future.value(),
                  };
                  setModel(
                    model.copyWith(chapters: model.chapters.removeAt(index)),
                  );
                },
              ),
            )
            .toNullable() ??
        Future.value();
  }

  void addChapter() {
    _debounceUpdate();
    state.map(
      (model) => setModel(
        model.copyWith(
          chapters: model.chapters.add(
            MangaChapter(
              id: ref.read(P.uuid).v4(),
              name: null,
              images: const MangaChapterImages.stored(loading: false),
            ),
          ),
        ),
      ),
    );
  }

  void setTelegraphParsingUsage(int chIndex, bool value) {
    _debounceUpdate();
    state.map(
      (model) => setModel(
        model.copyWith(
          chapters: model.chapters.replace(
            chIndex,
            model.chapters.get(chIndex).copyWith(
                  images: value
                      ? const MangaChapterImages.stored(loading: false)
                      : const MangaChapterImages.list(images: IList.empty()),
                ),
          ),
        ),
      ),
    );
  }

  void setTelegraphMangaName(int chIndex, String name) {
    _debounceUpdate();
    state.map(
      (model) => setModel(
        model.copyWith(
          chapters: model.chapters.replace(
            chIndex,
            model.chapters.get(chIndex).let(
                  (chapter) => switch (chapter.images) {
                    MangaChapterImagesStored mcis => chapter.copyWith(
                        images: mcis.copyWith(url: name),
                      ),
                    _ => chapter,
                  },
                ),
          ),
        ),
      ),
    );
  }

  void updateChapterName(int index, String name) {
    _debounceUpdate();
    state.map(
      (model) => setModel(
        model.copyWith(
          chapters: model.chapters.replace(
            index,
            model.chapters.get(index).copyWith(name: name),
          ),
        ),
      ),
    );
  }
}
