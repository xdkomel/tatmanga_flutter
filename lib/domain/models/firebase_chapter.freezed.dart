// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FirebaseChapter _$FirebaseChapterFromJson(Map<String, dynamic> json) {
  return _FirebaseChapter.fromJson(json);
}

/// @nodoc
mixin _$FirebaseChapter {
  @JsonKey(name: 'chapter_name')
  String? get chapterName => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapter_images')
  ChapterImages get images => throw _privateConstructorUsedError;

  /// Serializes this FirebaseChapter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FirebaseChapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FirebaseChapterCopyWith<FirebaseChapter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseChapterCopyWith<$Res> {
  factory $FirebaseChapterCopyWith(
          FirebaseChapter value, $Res Function(FirebaseChapter) then) =
      _$FirebaseChapterCopyWithImpl<$Res, FirebaseChapter>;
  @useResult
  $Res call(
      {@JsonKey(name: 'chapter_name') String? chapterName,
      @JsonKey(name: 'chapter_images') ChapterImages images});

  $ChapterImagesCopyWith<$Res> get images;
}

/// @nodoc
class _$FirebaseChapterCopyWithImpl<$Res, $Val extends FirebaseChapter>
    implements $FirebaseChapterCopyWith<$Res> {
  _$FirebaseChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirebaseChapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapterName = freezed,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      chapterName: freezed == chapterName
          ? _value.chapterName
          : chapterName // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as ChapterImages,
    ) as $Val);
  }

  /// Create a copy of FirebaseChapter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChapterImagesCopyWith<$Res> get images {
    return $ChapterImagesCopyWith<$Res>(_value.images, (value) {
      return _then(_value.copyWith(images: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FirebaseChapterImplCopyWith<$Res>
    implements $FirebaseChapterCopyWith<$Res> {
  factory _$$FirebaseChapterImplCopyWith(_$FirebaseChapterImpl value,
          $Res Function(_$FirebaseChapterImpl) then) =
      __$$FirebaseChapterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'chapter_name') String? chapterName,
      @JsonKey(name: 'chapter_images') ChapterImages images});

  @override
  $ChapterImagesCopyWith<$Res> get images;
}

/// @nodoc
class __$$FirebaseChapterImplCopyWithImpl<$Res>
    extends _$FirebaseChapterCopyWithImpl<$Res, _$FirebaseChapterImpl>
    implements _$$FirebaseChapterImplCopyWith<$Res> {
  __$$FirebaseChapterImplCopyWithImpl(
      _$FirebaseChapterImpl _value, $Res Function(_$FirebaseChapterImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseChapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapterName = freezed,
    Object? images = null,
  }) {
    return _then(_$FirebaseChapterImpl(
      chapterName: freezed == chapterName
          ? _value.chapterName
          : chapterName // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as ChapterImages,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirebaseChapterImpl implements _FirebaseChapter {
  const _$FirebaseChapterImpl(
      {@JsonKey(name: 'chapter_name') required this.chapterName,
      @JsonKey(name: 'chapter_images') required this.images});

  factory _$FirebaseChapterImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirebaseChapterImplFromJson(json);

  @override
  @JsonKey(name: 'chapter_name')
  final String? chapterName;
  @override
  @JsonKey(name: 'chapter_images')
  final ChapterImages images;

  @override
  String toString() {
    return 'FirebaseChapter(chapterName: $chapterName, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseChapterImpl &&
            (identical(other.chapterName, chapterName) ||
                other.chapterName == chapterName) &&
            (identical(other.images, images) || other.images == images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, chapterName, images);

  /// Create a copy of FirebaseChapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseChapterImplCopyWith<_$FirebaseChapterImpl> get copyWith =>
      __$$FirebaseChapterImplCopyWithImpl<_$FirebaseChapterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirebaseChapterImplToJson(
      this,
    );
  }
}

abstract class _FirebaseChapter implements FirebaseChapter {
  const factory _FirebaseChapter(
      {@JsonKey(name: 'chapter_name') required final String? chapterName,
      @JsonKey(name: 'chapter_images')
      required final ChapterImages images}) = _$FirebaseChapterImpl;

  factory _FirebaseChapter.fromJson(Map<String, dynamic> json) =
      _$FirebaseChapterImpl.fromJson;

  @override
  @JsonKey(name: 'chapter_name')
  String? get chapterName;
  @override
  @JsonKey(name: 'chapter_images')
  ChapterImages get images;

  /// Create a copy of FirebaseChapter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseChapterImplCopyWith<_$FirebaseChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChapterImages _$ChapterImagesFromJson(Map<String, dynamic> json) {
  switch (json['chapter_images_type']) {
    case 'files':
      return ChapterImagesFiles.fromJson(json);
    case 'telegraph_chapter':
      return ChapterImagesTelegraphChapter.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'chapter_images_type',
          'ChapterImages',
          'Invalid union type "${json['chapter_images_type']}"!');
  }
}

/// @nodoc
mixin _$ChapterImages {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SingleImage> images) files,
    required TResult Function(String telegraphUrl) telegraphChapter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SingleImage> images)? files,
    TResult? Function(String telegraphUrl)? telegraphChapter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SingleImage> images)? files,
    TResult Function(String telegraphUrl)? telegraphChapter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChapterImagesFiles value) files,
    required TResult Function(ChapterImagesTelegraphChapter value)
        telegraphChapter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChapterImagesFiles value)? files,
    TResult? Function(ChapterImagesTelegraphChapter value)? telegraphChapter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChapterImagesFiles value)? files,
    TResult Function(ChapterImagesTelegraphChapter value)? telegraphChapter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ChapterImages to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterImagesCopyWith<$Res> {
  factory $ChapterImagesCopyWith(
          ChapterImages value, $Res Function(ChapterImages) then) =
      _$ChapterImagesCopyWithImpl<$Res, ChapterImages>;
}

/// @nodoc
class _$ChapterImagesCopyWithImpl<$Res, $Val extends ChapterImages>
    implements $ChapterImagesCopyWith<$Res> {
  _$ChapterImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapterImages
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ChapterImagesFilesImplCopyWith<$Res> {
  factory _$$ChapterImagesFilesImplCopyWith(_$ChapterImagesFilesImpl value,
          $Res Function(_$ChapterImagesFilesImpl) then) =
      __$$ChapterImagesFilesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SingleImage> images});
}

/// @nodoc
class __$$ChapterImagesFilesImplCopyWithImpl<$Res>
    extends _$ChapterImagesCopyWithImpl<$Res, _$ChapterImagesFilesImpl>
    implements _$$ChapterImagesFilesImplCopyWith<$Res> {
  __$$ChapterImagesFilesImplCopyWithImpl(_$ChapterImagesFilesImpl _value,
      $Res Function(_$ChapterImagesFilesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChapterImages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_$ChapterImagesFilesImpl(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<SingleImage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterImagesFilesImpl implements ChapterImagesFiles {
  const _$ChapterImagesFilesImpl(
      {required final List<SingleImage> images, final String? $type})
      : _images = images,
        $type = $type ?? 'files';

  factory _$ChapterImagesFilesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterImagesFilesImplFromJson(json);

  final List<SingleImage> _images;
  @override
  List<SingleImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @JsonKey(name: 'chapter_images_type')
  final String $type;

  @override
  String toString() {
    return 'ChapterImages.files(images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterImagesFilesImpl &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  /// Create a copy of ChapterImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterImagesFilesImplCopyWith<_$ChapterImagesFilesImpl> get copyWith =>
      __$$ChapterImagesFilesImplCopyWithImpl<_$ChapterImagesFilesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SingleImage> images) files,
    required TResult Function(String telegraphUrl) telegraphChapter,
  }) {
    return files(images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SingleImage> images)? files,
    TResult? Function(String telegraphUrl)? telegraphChapter,
  }) {
    return files?.call(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SingleImage> images)? files,
    TResult Function(String telegraphUrl)? telegraphChapter,
    required TResult orElse(),
  }) {
    if (files != null) {
      return files(images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChapterImagesFiles value) files,
    required TResult Function(ChapterImagesTelegraphChapter value)
        telegraphChapter,
  }) {
    return files(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChapterImagesFiles value)? files,
    TResult? Function(ChapterImagesTelegraphChapter value)? telegraphChapter,
  }) {
    return files?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChapterImagesFiles value)? files,
    TResult Function(ChapterImagesTelegraphChapter value)? telegraphChapter,
    required TResult orElse(),
  }) {
    if (files != null) {
      return files(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterImagesFilesImplToJson(
      this,
    );
  }
}

abstract class ChapterImagesFiles implements ChapterImages {
  const factory ChapterImagesFiles({required final List<SingleImage> images}) =
      _$ChapterImagesFilesImpl;

  factory ChapterImagesFiles.fromJson(Map<String, dynamic> json) =
      _$ChapterImagesFilesImpl.fromJson;

  List<SingleImage> get images;

  /// Create a copy of ChapterImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterImagesFilesImplCopyWith<_$ChapterImagesFilesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChapterImagesTelegraphChapterImplCopyWith<$Res> {
  factory _$$ChapterImagesTelegraphChapterImplCopyWith(
          _$ChapterImagesTelegraphChapterImpl value,
          $Res Function(_$ChapterImagesTelegraphChapterImpl) then) =
      __$$ChapterImagesTelegraphChapterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String telegraphUrl});
}

/// @nodoc
class __$$ChapterImagesTelegraphChapterImplCopyWithImpl<$Res>
    extends _$ChapterImagesCopyWithImpl<$Res,
        _$ChapterImagesTelegraphChapterImpl>
    implements _$$ChapterImagesTelegraphChapterImplCopyWith<$Res> {
  __$$ChapterImagesTelegraphChapterImplCopyWithImpl(
      _$ChapterImagesTelegraphChapterImpl _value,
      $Res Function(_$ChapterImagesTelegraphChapterImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChapterImages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? telegraphUrl = null,
  }) {
    return _then(_$ChapterImagesTelegraphChapterImpl(
      telegraphUrl: null == telegraphUrl
          ? _value.telegraphUrl
          : telegraphUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterImagesTelegraphChapterImpl
    implements ChapterImagesTelegraphChapter {
  const _$ChapterImagesTelegraphChapterImpl(
      {required this.telegraphUrl, final String? $type})
      : $type = $type ?? 'telegraph_chapter';

  factory _$ChapterImagesTelegraphChapterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChapterImagesTelegraphChapterImplFromJson(json);

  @override
  final String telegraphUrl;

  @JsonKey(name: 'chapter_images_type')
  final String $type;

  @override
  String toString() {
    return 'ChapterImages.telegraphChapter(telegraphUrl: $telegraphUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterImagesTelegraphChapterImpl &&
            (identical(other.telegraphUrl, telegraphUrl) ||
                other.telegraphUrl == telegraphUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, telegraphUrl);

  /// Create a copy of ChapterImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterImagesTelegraphChapterImplCopyWith<
          _$ChapterImagesTelegraphChapterImpl>
      get copyWith => __$$ChapterImagesTelegraphChapterImplCopyWithImpl<
          _$ChapterImagesTelegraphChapterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SingleImage> images) files,
    required TResult Function(String telegraphUrl) telegraphChapter,
  }) {
    return telegraphChapter(telegraphUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SingleImage> images)? files,
    TResult? Function(String telegraphUrl)? telegraphChapter,
  }) {
    return telegraphChapter?.call(telegraphUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SingleImage> images)? files,
    TResult Function(String telegraphUrl)? telegraphChapter,
    required TResult orElse(),
  }) {
    if (telegraphChapter != null) {
      return telegraphChapter(telegraphUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChapterImagesFiles value) files,
    required TResult Function(ChapterImagesTelegraphChapter value)
        telegraphChapter,
  }) {
    return telegraphChapter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChapterImagesFiles value)? files,
    TResult? Function(ChapterImagesTelegraphChapter value)? telegraphChapter,
  }) {
    return telegraphChapter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChapterImagesFiles value)? files,
    TResult Function(ChapterImagesTelegraphChapter value)? telegraphChapter,
    required TResult orElse(),
  }) {
    if (telegraphChapter != null) {
      return telegraphChapter(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterImagesTelegraphChapterImplToJson(
      this,
    );
  }
}

abstract class ChapterImagesTelegraphChapter implements ChapterImages {
  const factory ChapterImagesTelegraphChapter(
          {required final String telegraphUrl}) =
      _$ChapterImagesTelegraphChapterImpl;

  factory ChapterImagesTelegraphChapter.fromJson(Map<String, dynamic> json) =
      _$ChapterImagesTelegraphChapterImpl.fromJson;

  String get telegraphUrl;

  /// Create a copy of ChapterImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterImagesTelegraphChapterImplCopyWith<
          _$ChapterImagesTelegraphChapterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
