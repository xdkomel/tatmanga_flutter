// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirebaseChapterImpl _$$FirebaseChapterImplFromJson(
        Map<String, dynamic> json) =>
    _$FirebaseChapterImpl(
      chapterName: json['chapter_name'] as String?,
      images: ChapterImages.fromJson(
          json['chapter_images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FirebaseChapterImplToJson(
        _$FirebaseChapterImpl instance) =>
    <String, dynamic>{
      'chapter_name': instance.chapterName,
      'chapter_images': instance.images,
    };

_$ChapterImagesFilesImpl _$$ChapterImagesFilesImplFromJson(
        Map<String, dynamic> json) =>
    _$ChapterImagesFilesImpl(
      images: (json['images'] as List<dynamic>)
          .map((e) => SingleImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['chapter_images_type'] as String?,
    );

Map<String, dynamic> _$$ChapterImagesFilesImplToJson(
        _$ChapterImagesFilesImpl instance) =>
    <String, dynamic>{
      'images': instance.images,
      'chapter_images_type': instance.$type,
    };

_$ChapterImagesTelegraphChapterImpl
    _$$ChapterImagesTelegraphChapterImplFromJson(Map<String, dynamic> json) =>
        _$ChapterImagesTelegraphChapterImpl(
          telegraphUrl: json['telegraph_url'] as String,
          $type: json['chapter_images_type'] as String?,
        );

Map<String, dynamic> _$$ChapterImagesTelegraphChapterImplToJson(
        _$ChapterImagesTelegraphChapterImpl instance) =>
    <String, dynamic>{
      'telegraph_url': instance.telegraphUrl,
      'chapter_images_type': instance.$type,
    };
