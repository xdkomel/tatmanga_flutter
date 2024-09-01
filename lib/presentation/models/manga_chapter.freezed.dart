// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MangaChapter {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  MangaChapterImages get images => throw _privateConstructorUsedError;

  /// Create a copy of MangaChapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MangaChapterCopyWith<MangaChapter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaChapterCopyWith<$Res> {
  factory $MangaChapterCopyWith(
          MangaChapter value, $Res Function(MangaChapter) then) =
      _$MangaChapterCopyWithImpl<$Res, MangaChapter>;
  @useResult
  $Res call({String id, String? name, MangaChapterImages images});

  $MangaChapterImagesCopyWith<$Res> get images;
}

/// @nodoc
class _$MangaChapterCopyWithImpl<$Res, $Val extends MangaChapter>
    implements $MangaChapterCopyWith<$Res> {
  _$MangaChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MangaChapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as MangaChapterImages,
    ) as $Val);
  }

  /// Create a copy of MangaChapter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MangaChapterImagesCopyWith<$Res> get images {
    return $MangaChapterImagesCopyWith<$Res>(_value.images, (value) {
      return _then(_value.copyWith(images: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MangaChapterImplCopyWith<$Res>
    implements $MangaChapterCopyWith<$Res> {
  factory _$$MangaChapterImplCopyWith(
          _$MangaChapterImpl value, $Res Function(_$MangaChapterImpl) then) =
      __$$MangaChapterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? name, MangaChapterImages images});

  @override
  $MangaChapterImagesCopyWith<$Res> get images;
}

/// @nodoc
class __$$MangaChapterImplCopyWithImpl<$Res>
    extends _$MangaChapterCopyWithImpl<$Res, _$MangaChapterImpl>
    implements _$$MangaChapterImplCopyWith<$Res> {
  __$$MangaChapterImplCopyWithImpl(
      _$MangaChapterImpl _value, $Res Function(_$MangaChapterImpl) _then)
      : super(_value, _then);

  /// Create a copy of MangaChapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? images = null,
  }) {
    return _then(_$MangaChapterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as MangaChapterImages,
    ));
  }
}

/// @nodoc

class _$MangaChapterImpl implements _MangaChapter {
  const _$MangaChapterImpl(
      {required this.id, required this.name, required this.images});

  @override
  final String id;
  @override
  final String? name;
  @override
  final MangaChapterImages images;

  @override
  String toString() {
    return 'MangaChapter(id: $id, name: $name, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaChapterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.images, images) || other.images == images));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, images);

  /// Create a copy of MangaChapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MangaChapterImplCopyWith<_$MangaChapterImpl> get copyWith =>
      __$$MangaChapterImplCopyWithImpl<_$MangaChapterImpl>(this, _$identity);
}

abstract class _MangaChapter implements MangaChapter {
  const factory _MangaChapter(
      {required final String id,
      required final String? name,
      required final MangaChapterImages images}) = _$MangaChapterImpl;

  @override
  String get id;
  @override
  String? get name;
  @override
  MangaChapterImages get images;

  /// Create a copy of MangaChapter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MangaChapterImplCopyWith<_$MangaChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MangaChapterImages {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IList<StatusImageData> images) list,
    required TResult Function(bool loading, String? errorMessage, String? url)
        stored,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IList<StatusImageData> images)? list,
    TResult? Function(bool loading, String? errorMessage, String? url)? stored,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IList<StatusImageData> images)? list,
    TResult Function(bool loading, String? errorMessage, String? url)? stored,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MangaChapterImagesList value) list,
    required TResult Function(MangaChapterImagesStored value) stored,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MangaChapterImagesList value)? list,
    TResult? Function(MangaChapterImagesStored value)? stored,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MangaChapterImagesList value)? list,
    TResult Function(MangaChapterImagesStored value)? stored,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaChapterImagesCopyWith<$Res> {
  factory $MangaChapterImagesCopyWith(
          MangaChapterImages value, $Res Function(MangaChapterImages) then) =
      _$MangaChapterImagesCopyWithImpl<$Res, MangaChapterImages>;
}

/// @nodoc
class _$MangaChapterImagesCopyWithImpl<$Res, $Val extends MangaChapterImages>
    implements $MangaChapterImagesCopyWith<$Res> {
  _$MangaChapterImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MangaChapterImages
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MangaChapterImagesListImplCopyWith<$Res> {
  factory _$$MangaChapterImagesListImplCopyWith(
          _$MangaChapterImagesListImpl value,
          $Res Function(_$MangaChapterImagesListImpl) then) =
      __$$MangaChapterImagesListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({IList<StatusImageData> images});
}

/// @nodoc
class __$$MangaChapterImagesListImplCopyWithImpl<$Res>
    extends _$MangaChapterImagesCopyWithImpl<$Res, _$MangaChapterImagesListImpl>
    implements _$$MangaChapterImagesListImplCopyWith<$Res> {
  __$$MangaChapterImagesListImplCopyWithImpl(
      _$MangaChapterImagesListImpl _value,
      $Res Function(_$MangaChapterImagesListImpl) _then)
      : super(_value, _then);

  /// Create a copy of MangaChapterImages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_$MangaChapterImagesListImpl(
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as IList<StatusImageData>,
    ));
  }
}

/// @nodoc

class _$MangaChapterImagesListImpl implements MangaChapterImagesList {
  const _$MangaChapterImagesListImpl({required this.images});

  @override
  final IList<StatusImageData> images;

  @override
  String toString() {
    return 'MangaChapterImages.list(images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaChapterImagesListImpl &&
            const DeepCollectionEquality().equals(other.images, images));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(images));

  /// Create a copy of MangaChapterImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MangaChapterImagesListImplCopyWith<_$MangaChapterImagesListImpl>
      get copyWith => __$$MangaChapterImagesListImplCopyWithImpl<
          _$MangaChapterImagesListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IList<StatusImageData> images) list,
    required TResult Function(bool loading, String? errorMessage, String? url)
        stored,
  }) {
    return list(images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IList<StatusImageData> images)? list,
    TResult? Function(bool loading, String? errorMessage, String? url)? stored,
  }) {
    return list?.call(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IList<StatusImageData> images)? list,
    TResult Function(bool loading, String? errorMessage, String? url)? stored,
    required TResult orElse(),
  }) {
    if (list != null) {
      return list(images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MangaChapterImagesList value) list,
    required TResult Function(MangaChapterImagesStored value) stored,
  }) {
    return list(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MangaChapterImagesList value)? list,
    TResult? Function(MangaChapterImagesStored value)? stored,
  }) {
    return list?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MangaChapterImagesList value)? list,
    TResult Function(MangaChapterImagesStored value)? stored,
    required TResult orElse(),
  }) {
    if (list != null) {
      return list(this);
    }
    return orElse();
  }
}

abstract class MangaChapterImagesList implements MangaChapterImages {
  const factory MangaChapterImagesList(
          {required final IList<StatusImageData> images}) =
      _$MangaChapterImagesListImpl;

  IList<StatusImageData> get images;

  /// Create a copy of MangaChapterImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MangaChapterImagesListImplCopyWith<_$MangaChapterImagesListImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MangaChapterImagesStoredImplCopyWith<$Res> {
  factory _$$MangaChapterImagesStoredImplCopyWith(
          _$MangaChapterImagesStoredImpl value,
          $Res Function(_$MangaChapterImagesStoredImpl) then) =
      __$$MangaChapterImagesStoredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loading, String? errorMessage, String? url});
}

/// @nodoc
class __$$MangaChapterImagesStoredImplCopyWithImpl<$Res>
    extends _$MangaChapterImagesCopyWithImpl<$Res,
        _$MangaChapterImagesStoredImpl>
    implements _$$MangaChapterImagesStoredImplCopyWith<$Res> {
  __$$MangaChapterImagesStoredImplCopyWithImpl(
      _$MangaChapterImagesStoredImpl _value,
      $Res Function(_$MangaChapterImagesStoredImpl) _then)
      : super(_value, _then);

  /// Create a copy of MangaChapterImages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorMessage = freezed,
    Object? url = freezed,
  }) {
    return _then(_$MangaChapterImagesStoredImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MangaChapterImagesStoredImpl implements MangaChapterImagesStored {
  const _$MangaChapterImagesStoredImpl(
      {required this.loading, this.errorMessage, this.url});

  @override
  final bool loading;
  @override
  final String? errorMessage;
  @override
  final String? url;

  @override
  String toString() {
    return 'MangaChapterImages.stored(loading: $loading, errorMessage: $errorMessage, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaChapterImagesStoredImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, errorMessage, url);

  /// Create a copy of MangaChapterImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MangaChapterImagesStoredImplCopyWith<_$MangaChapterImagesStoredImpl>
      get copyWith => __$$MangaChapterImagesStoredImplCopyWithImpl<
          _$MangaChapterImagesStoredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IList<StatusImageData> images) list,
    required TResult Function(bool loading, String? errorMessage, String? url)
        stored,
  }) {
    return stored(loading, errorMessage, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IList<StatusImageData> images)? list,
    TResult? Function(bool loading, String? errorMessage, String? url)? stored,
  }) {
    return stored?.call(loading, errorMessage, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IList<StatusImageData> images)? list,
    TResult Function(bool loading, String? errorMessage, String? url)? stored,
    required TResult orElse(),
  }) {
    if (stored != null) {
      return stored(loading, errorMessage, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MangaChapterImagesList value) list,
    required TResult Function(MangaChapterImagesStored value) stored,
  }) {
    return stored(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MangaChapterImagesList value)? list,
    TResult? Function(MangaChapterImagesStored value)? stored,
  }) {
    return stored?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MangaChapterImagesList value)? list,
    TResult Function(MangaChapterImagesStored value)? stored,
    required TResult orElse(),
  }) {
    if (stored != null) {
      return stored(this);
    }
    return orElse();
  }
}

abstract class MangaChapterImagesStored implements MangaChapterImages {
  const factory MangaChapterImagesStored(
      {required final bool loading,
      final String? errorMessage,
      final String? url}) = _$MangaChapterImagesStoredImpl;

  bool get loading;
  String? get errorMessage;
  String? get url;

  /// Create a copy of MangaChapterImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MangaChapterImagesStoredImplCopyWith<_$MangaChapterImagesStoredImpl>
      get copyWith => throw _privateConstructorUsedError;
}
