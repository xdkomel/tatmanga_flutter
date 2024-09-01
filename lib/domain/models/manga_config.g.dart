// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MangaConfigImpl _$$MangaConfigImplFromJson(Map<String, dynamic> json) =>
    _$MangaConfigImpl(
      mangaId: json['manga_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      coverImage: json['cover_image'] == null
          ? null
          : SingleImage.fromJson(json['cover_image'] as Map<String, dynamic>),
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => AuthorData.fromJson(e as Map<String, dynamic>))
          .toList(),
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => FirebaseChapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MangaConfigImplToJson(_$MangaConfigImpl instance) =>
    <String, dynamic>{
      'manga_id': instance.mangaId,
      'title': instance.title,
      'description': instance.description,
      'cover_image': instance.coverImage,
      'authors': instance.authors,
      'chapters': instance.chapters,
    };

_$AuthorDataImpl _$$AuthorDataImplFromJson(Map<String, dynamic> json) =>
    _$AuthorDataImpl(
      name: json['name'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$AuthorDataImplToJson(_$AuthorDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
    };
