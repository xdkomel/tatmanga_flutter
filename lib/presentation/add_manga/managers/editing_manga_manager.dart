import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tatmanga_flutter/presentation/models/editing_manga_model.dart';
import 'package:tatmanga_flutter/presentation/models/editing_manga_model_extension.dart';
import 'package:tatmanga_flutter/presentation/common/image_data.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class EditingMangaManager extends Notifier<Option<EditingMangaModel>> {
  @override
  Option<EditingMangaModel> build() => const None();

  A? withState<A>(A Function(EditingMangaModel) action) => (state.toNullable()).map(action);

  void setModel(EditingMangaModel model) => state = Some(model);

  Future<void> uploadConfig() => withState(_uploadConfig) ?? Future.value();

  Future<void> _uploadConfig(EditingMangaModel model) async {
    await ref.read(P.storage).uploadConfig(model.toConfig);
  }

  Future<void> uploadCoverImage() => withState(_uploadCover) ?? Future.value();

  Future<void> _uploadCover(EditingMangaModel model) async {
    final file = await FilePicker.platform.pickFiles();
    await (file?.files.firstOrNull).map(
      (f) => f.bytes.map(
        (bytes) async {
          _setCover(f.name, bytes);
          await _uploadImage(model.mangaId, f.name, bytes);
        },
      ),
    );
  }

  Future<void> addEpisodeImages(int eposodeIndex) =>
      withState(
        (a) => _addImages(a, eposodeIndex),
      ) ??
      Future.value();

  Future<void> removeCover() async {}

  Future<void> removeImage(int episodeIndex, int imageIndex) =>
      state.toNullable().map(
            (model) => model.episodes.getOrNull(episodeIndex).map(
                  (episode) => episode.images.getOrNull(imageIndex).map((image) async {
                    _replaceImage(
                      model: model,
                      episodeIndex: episodeIndex,
                      imageIndex: imageIndex,
                      episode: episode,
                      image: image.image,
                    );
                    await ref.read(P.storage).removeImage(model.mangaId, image.image.name);
                    _removeImage(
                      model: model,
                      episodeIndex: episodeIndex,
                      episode: episode,
                      imageIndex: imageIndex,
                    );
                  }),
                ),
          ) ??
      Future.value();

  void _replaceImage({
    required EditingMangaModel model,
    required int episodeIndex,
    required int imageIndex,
    required Episode episode,
    required ImageData image,
  }) =>
      state = Some(
        model.copyWith(
          episodes: model.episodes.replace(
            episodeIndex,
            episode.copyWith(
              images: episode.images.replace(
                imageIndex,
                StatusImageData(
                  image: image,
                  status: ImageDataStatus.deleting,
                ),
              ),
            ),
          ),
        ),
      );

  void _removeImage({
    required EditingMangaModel model,
    required int episodeIndex,
    required Episode episode,
    required int imageIndex,
  }) =>
      state = Some(
        model.copyWith(
          episodes: model.episodes.replace(
            episodeIndex,
            episode.copyWith(
              images: episode.images.removeAt(imageIndex),
            ),
          ),
        ),
      );

  Future<void> _addImages(EditingMangaModel model, int eposodeIndex) async {
    final files = await FilePicker.platform.pickFiles(allowMultiple: true);
    await files.map(
      (fs) => fs.files
          .map(
            (f) => f.bytes.map((b) => (f.name, b)),
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

  int? _addLoadingImage(int eposodeIndex, String fileName, Uint8List bytes) => state
      .map(
        (model) => model.episodes.getOrNull(eposodeIndex).map(
          (episode) {
            state = Some(
              model.copyWith(
                episodes: model.episodes.replace(
                  eposodeIndex,
                  episode.copyWith(
                    images: episode.images.add(
                      StatusImageData(
                        image: BytesImage(fileName, bytes),
                        status: ImageDataStatus.uploading,
                      ),
                    ),
                  ),
                ),
              ),
            );
            // last image index is the previous list's length
            return episode.images.length;
          },
        ),
      )
      .toNullable();

  void _setCover(String fileName, Uint8List bytes) => state.map(
        (model) => state = Some(
          model.copyWith(
            coverImage: BytesImage(fileName, bytes),
          ),
        ),
      );

  void _markImageLoaded(int eposodeIndex, int index) => state.map(
        (model) => model.episodes.getOrNull(eposodeIndex).map(
              (episode) => state = Some(
                model.copyWith(
                  episodes: model.episodes.replace(
                    eposodeIndex,
                    episode.copyWith(
                      images: episode.images.replace(
                        index,
                        StatusImageData(
                          image: episode.images.get(index).image,
                          status: ImageDataStatus.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
      );

  Future<void> _uploadImage(String mangaId, String fileName, Uint8List bytes) =>
      ref.read(P.storage).uploadImage(mangaId, fileName, bytes);
}
