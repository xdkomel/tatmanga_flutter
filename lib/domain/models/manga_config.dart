import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tatmanga_flutter/domain/models/firebase_chapter.dart';
import 'package:tatmanga_flutter/domain/models/single_image.dart';

part 'manga_config.freezed.dart';
part 'manga_config.g.dart';

@freezed
class MangaConfig with _$MangaConfig {
  const factory MangaConfig({
    @JsonKey(name: 'manga_id') required String mangaId,
    required String title,
    required String? description,
    @JsonKey(name: 'cover_image') required SingleImage? coverImage,
    required List<AuthorData>? authors,
    required List<FirebaseChapter> chapters,
  }) = _MangaConfig;

  factory MangaConfig.fromJson(Map<String, dynamic> json) =>
      _$MangaConfigFromJson(json);
}

@freezed
class AuthorData with _$AuthorData {
  const factory AuthorData({
    required String name,
    required String role,
  }) = _AuthorData;

  factory AuthorData.fromJson(Map<String, dynamic> json) =>
      _$AuthorDataFromJson(json);
}
