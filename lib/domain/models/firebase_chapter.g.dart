// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirebaseChapterImpl _$$FirebaseChapterImplFromJson(
        Map<String, dynamic> json) =>
    _$FirebaseChapterImpl(
      name: json['name'] as String?,
      filesNames: (json['files_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$FirebaseChapterImplToJson(
        _$FirebaseChapterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'files_names': instance.filesNames,
    };
