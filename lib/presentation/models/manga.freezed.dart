// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Manga {
  String get mangaId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  StatusImageData? get cover => throw _privateConstructorUsedError;
  IList<Author> get authors => throw _privateConstructorUsedError;
  IList<MangaChapter> get chapters => throw _privateConstructorUsedError;
  bool get configUploading => throw _privateConstructorUsedError;

  /// Create a copy of Manga
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MangaCopyWith<Manga> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaCopyWith<$Res> {
  factory $MangaCopyWith(Manga value, $Res Function(Manga) then) =
      _$MangaCopyWithImpl<$Res, Manga>;
  @useResult
  $Res call(
      {String mangaId,
      String title,
      String? description,
      StatusImageData? cover,
      IList<Author> authors,
      IList<MangaChapter> chapters,
      bool configUploading});

  $StatusImageDataCopyWith<$Res>? get cover;
}

/// @nodoc
class _$MangaCopyWithImpl<$Res, $Val extends Manga>
    implements $MangaCopyWith<$Res> {
  _$MangaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Manga
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mangaId = null,
    Object? title = null,
    Object? description = freezed,
    Object? cover = freezed,
    Object? authors = null,
    Object? chapters = null,
    Object? configUploading = null,
  }) {
    return _then(_value.copyWith(
      mangaId: null == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as StatusImageData?,
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as IList<Author>,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as IList<MangaChapter>,
      configUploading: null == configUploading
          ? _value.configUploading
          : configUploading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of Manga
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusImageDataCopyWith<$Res>? get cover {
    if (_value.cover == null) {
      return null;
    }

    return $StatusImageDataCopyWith<$Res>(_value.cover!, (value) {
      return _then(_value.copyWith(cover: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MangaImplCopyWith<$Res> implements $MangaCopyWith<$Res> {
  factory _$$MangaImplCopyWith(
          _$MangaImpl value, $Res Function(_$MangaImpl) then) =
      __$$MangaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mangaId,
      String title,
      String? description,
      StatusImageData? cover,
      IList<Author> authors,
      IList<MangaChapter> chapters,
      bool configUploading});

  @override
  $StatusImageDataCopyWith<$Res>? get cover;
}

/// @nodoc
class __$$MangaImplCopyWithImpl<$Res>
    extends _$MangaCopyWithImpl<$Res, _$MangaImpl>
    implements _$$MangaImplCopyWith<$Res> {
  __$$MangaImplCopyWithImpl(
      _$MangaImpl _value, $Res Function(_$MangaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Manga
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mangaId = null,
    Object? title = null,
    Object? description = freezed,
    Object? cover = freezed,
    Object? authors = null,
    Object? chapters = null,
    Object? configUploading = null,
  }) {
    return _then(_$MangaImpl(
      mangaId: null == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as StatusImageData?,
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as IList<Author>,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as IList<MangaChapter>,
      configUploading: null == configUploading
          ? _value.configUploading
          : configUploading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MangaImpl implements _Manga {
  const _$MangaImpl(
      {required this.mangaId,
      required this.title,
      required this.description,
      required this.cover,
      required this.authors,
      required this.chapters,
      required this.configUploading});

  @override
  final String mangaId;
  @override
  final String title;
  @override
  final String? description;
  @override
  final StatusImageData? cover;
  @override
  final IList<Author> authors;
  @override
  final IList<MangaChapter> chapters;
  @override
  final bool configUploading;

  @override
  String toString() {
    return 'Manga(mangaId: $mangaId, title: $title, description: $description, cover: $cover, authors: $authors, chapters: $chapters, configUploading: $configUploading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaImpl &&
            (identical(other.mangaId, mangaId) || other.mangaId == mangaId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            const DeepCollectionEquality().equals(other.authors, authors) &&
            const DeepCollectionEquality().equals(other.chapters, chapters) &&
            (identical(other.configUploading, configUploading) ||
                other.configUploading == configUploading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mangaId,
      title,
      description,
      cover,
      const DeepCollectionEquality().hash(authors),
      const DeepCollectionEquality().hash(chapters),
      configUploading);

  /// Create a copy of Manga
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MangaImplCopyWith<_$MangaImpl> get copyWith =>
      __$$MangaImplCopyWithImpl<_$MangaImpl>(this, _$identity);
}

abstract class _Manga implements Manga {
  const factory _Manga(
      {required final String mangaId,
      required final String title,
      required final String? description,
      required final StatusImageData? cover,
      required final IList<Author> authors,
      required final IList<MangaChapter> chapters,
      required final bool configUploading}) = _$MangaImpl;

  @override
  String get mangaId;
  @override
  String get title;
  @override
  String? get description;
  @override
  StatusImageData? get cover;
  @override
  IList<Author> get authors;
  @override
  IList<MangaChapter> get chapters;
  @override
  bool get configUploading;

  /// Create a copy of Manga
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MangaImplCopyWith<_$MangaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
