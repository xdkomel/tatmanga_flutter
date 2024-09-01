// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SingleImageUrlImpl _$$SingleImageUrlImplFromJson(Map<String, dynamic> json) =>
    _$SingleImageUrlImpl(
      url: json['url'] as String,
      $type: json['image_type'] as String?,
    );

Map<String, dynamic> _$$SingleImageUrlImplToJson(
        _$SingleImageUrlImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'image_type': instance.$type,
    };

_$SingleImageFirebaseFileImpl _$$SingleImageFirebaseFileImplFromJson(
        Map<String, dynamic> json) =>
    _$SingleImageFirebaseFileImpl(
      fileName: json['file_name'] as String,
      $type: json['image_type'] as String?,
    );

Map<String, dynamic> _$$SingleImageFirebaseFileImplToJson(
        _$SingleImageFirebaseFileImpl instance) =>
    <String, dynamic>{
      'file_name': instance.fileName,
      'image_type': instance.$type,
    };
