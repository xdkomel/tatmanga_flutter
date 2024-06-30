import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tatmanga_flutter/domain/models/firebase_chapter.dart';

part 'manga_config.freezed.dart';
part 'manga_config.g.dart';

@freezed
class MangaConfig with _$MangaConfig {
  factory MangaConfig({
    @JsonKey(name: 'manga_id') required String mangaId,
    required String title,
    required String? description,
    @JsonKey(name: 'cover_name') required String? coverName,
    required List<AuthorData>? authors,
    required List<FirebaseChapter> chapters,
  }) = _MangaConfig;

  factory MangaConfig.fromJson(Map<String, dynamic> json) => _$MangaConfigFromJson(json);
}

@freezed
class AuthorData with _$AuthorData {
  factory AuthorData({
    required String name,
    required String role,
  }) = _AuthorData;

  factory AuthorData.fromJson(Map<String, dynamic> json) => _$AuthorDataFromJson(json);
}
