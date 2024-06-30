// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editing_manga_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditingMangaModel {
  ImageData get coverImage => throw _privateConstructorUsedError;
  String get mangaId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  IList<AuthorData> get authors => throw _privateConstructorUsedError;
  IList<Episode> get episodes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditingMangaModelCopyWith<EditingMangaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditingMangaModelCopyWith<$Res> {
  factory $EditingMangaModelCopyWith(
          EditingMangaModel value, $Res Function(EditingMangaModel) then) =
      _$EditingMangaModelCopyWithImpl<$Res, EditingMangaModel>;
  @useResult
  $Res call(
      {ImageData coverImage,
      String mangaId,
      String name,
      String description,
      IList<AuthorData> authors,
      IList<Episode> episodes});
}

/// @nodoc
class _$EditingMangaModelCopyWithImpl<$Res, $Val extends EditingMangaModel>
    implements $EditingMangaModelCopyWith<$Res> {
  _$EditingMangaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coverImage = null,
    Object? mangaId = null,
    Object? name = null,
    Object? description = null,
    Object? authors = null,
    Object? episodes = null,
  }) {
    return _then(_value.copyWith(
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as ImageData,
      mangaId: null == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as IList<AuthorData>,
      episodes: null == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as IList<Episode>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditingMangaModelImplCopyWith<$Res>
    implements $EditingMangaModelCopyWith<$Res> {
  factory _$$EditingMangaModelImplCopyWith(_$EditingMangaModelImpl value,
          $Res Function(_$EditingMangaModelImpl) then) =
      __$$EditingMangaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ImageData coverImage,
      String mangaId,
      String name,
      String description,
      IList<AuthorData> authors,
      IList<Episode> episodes});
}

/// @nodoc
class __$$EditingMangaModelImplCopyWithImpl<$Res>
    extends _$EditingMangaModelCopyWithImpl<$Res, _$EditingMangaModelImpl>
    implements _$$EditingMangaModelImplCopyWith<$Res> {
  __$$EditingMangaModelImplCopyWithImpl(_$EditingMangaModelImpl _value,
      $Res Function(_$EditingMangaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coverImage = null,
    Object? mangaId = null,
    Object? name = null,
    Object? description = null,
    Object? authors = null,
    Object? episodes = null,
  }) {
    return _then(_$EditingMangaModelImpl(
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as ImageData,
      mangaId: null == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as IList<AuthorData>,
      episodes: null == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as IList<Episode>,
    ));
  }
}

/// @nodoc

class _$EditingMangaModelImpl implements _EditingMangaModel {
  const _$EditingMangaModelImpl(
      {required this.coverImage,
      required this.mangaId,
      required this.name,
      required this.description,
      required this.authors,
      required this.episodes});

  @override
  final ImageData coverImage;
  @override
  final String mangaId;
  @override
  final String name;
  @override
  final String description;
  @override
  final IList<AuthorData> authors;
  @override
  final IList<Episode> episodes;

  @override
  String toString() {
    return 'EditingMangaModel(coverImage: $coverImage, mangaId: $mangaId, name: $name, description: $description, authors: $authors, episodes: $episodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditingMangaModelImpl &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.mangaId, mangaId) || other.mangaId == mangaId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.authors, authors) &&
            const DeepCollectionEquality().equals(other.episodes, episodes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      coverImage,
      mangaId,
      name,
      description,
      const DeepCollectionEquality().hash(authors),
      const DeepCollectionEquality().hash(episodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditingMangaModelImplCopyWith<_$EditingMangaModelImpl> get copyWith =>
      __$$EditingMangaModelImplCopyWithImpl<_$EditingMangaModelImpl>(
          this, _$identity);
}

abstract class _EditingMangaModel implements EditingMangaModel {
  const factory _EditingMangaModel(
      {required final ImageData coverImage,
      required final String mangaId,
      required final String name,
      required final String description,
      required final IList<AuthorData> authors,
      required final IList<Episode> episodes}) = _$EditingMangaModelImpl;

  @override
  ImageData get coverImage;
  @override
  String get mangaId;
  @override
  String get name;
  @override
  String get description;
  @override
  IList<AuthorData> get authors;
  @override
  IList<Episode> get episodes;
  @override
  @JsonKey(ignore: true)
  _$$EditingMangaModelImplCopyWith<_$EditingMangaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Episode {
  String get name => throw _privateConstructorUsedError;
  IList<StatusImageData> get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EpisodeCopyWith<Episode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeCopyWith<$Res> {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) then) =
      _$EpisodeCopyWithImpl<$Res, Episode>;
  @useResult
  $Res call({String name, IList<StatusImageData> images});
}

/// @nodoc
class _$EpisodeCopyWithImpl<$Res, $Val extends Episode>
    implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as IList<StatusImageData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpisodeImplCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$$EpisodeImplCopyWith(
          _$EpisodeImpl value, $Res Function(_$EpisodeImpl) then) =
      __$$EpisodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, IList<StatusImageData> images});
}

/// @nodoc
class __$$EpisodeImplCopyWithImpl<$Res>
    extends _$EpisodeCopyWithImpl<$Res, _$EpisodeImpl>
    implements _$$EpisodeImplCopyWith<$Res> {
  __$$EpisodeImplCopyWithImpl(
      _$EpisodeImpl _value, $Res Function(_$EpisodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? images = null,
  }) {
    return _then(_$EpisodeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as IList<StatusImageData>,
    ));
  }
}

/// @nodoc

class _$EpisodeImpl implements _Episode {
  const _$EpisodeImpl({required this.name, required this.images});

  @override
  final String name;
  @override
  final IList<StatusImageData> images;

  @override
  String toString() {
    return 'Episode(name: $name, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.images, images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      __$$EpisodeImplCopyWithImpl<_$EpisodeImpl>(this, _$identity);
}

abstract class _Episode implements Episode {
  const factory _Episode(
      {required final String name,
      required final IList<StatusImageData> images}) = _$EpisodeImpl;

  @override
  String get name;
  @override
  IList<StatusImageData> get images;
  @override
  @JsonKey(ignore: true)
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
