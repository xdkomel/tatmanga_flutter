import 'package:freezed_annotation/freezed_annotation.dart';  
import 'package:tatmanga_flutter/presentation/common/image_data.dart';

part 'status_image_data.freezed.dart';

@freezed
class StatusImageData with _$StatusImageData {
  const factory StatusImageData({
    required ImageDataStatus status,
    required ImageData image,
  }) = _StatusImageData;
}

enum ImageDataStatus { none, uploading, deleting }