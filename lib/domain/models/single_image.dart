import 'package:freezed_annotation/freezed_annotation.dart';

part 'single_image.freezed.dart';
part 'single_image.g.dart';

@Freezed(unionKey: 'image_type', unionValueCase: FreezedUnionCase.snake)
sealed class SingleImage with _$SingleImage {
  const factory SingleImage.url({
    required String url,
  }) = SingleImageUrl;
  const factory SingleImage.firebaseFile({
    @JsonKey(name: 'file_name') required String fileName,
  }) = SingleImageFirebaseFile;

  factory SingleImage.fromJson(Map<String, dynamic> json) =>
      _$SingleImageFromJson(json);
}
