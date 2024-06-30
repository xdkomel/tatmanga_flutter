import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tatmanga_flutter/domain/models/manga_config.dart';
import 'package:tatmanga_flutter/presentation/common/image_data.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';

part 'editing_manga_model.freezed.dart';

@freezed
class EditingMangaModel with _$EditingMangaModel {
  const factory EditingMangaModel({
    required ImageData coverImage,
    required String mangaId,
    required String name,
    required String description,
    required IList<AuthorData> authors,
    required IList<Episode> episodes,
  }) = _EditingMangaModel;
}

@freezed
class Episode with _$Episode {
  const factory Episode({
    required String name,
    required IList<StatusImageData> images,
  }) = _Episode;
}
