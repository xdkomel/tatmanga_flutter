// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MangaConfig _$MangaConfigFromJson(Map<String, dynamic> json) {
  return _MangaConfig.fromJson(json);
}

/// @nodoc
mixin _$MangaConfig {
  @JsonKey(name: 'manga_id')
  String get mangaId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  SingleImage? get coverImage => throw _privateConstructorUsedError;
  List<AuthorData>? get authors => throw _privateConstructorUsedError;
  List<FirebaseChapter> get chapters => throw _privateConstructorUsedError;

  /// Serializes this MangaConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MangaConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MangaConfigCopyWith<MangaConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaConfigCopyWith<$Res> {
  factory $MangaConfigCopyWith(
          MangaConfig value, $Res Function(MangaConfig) then) =
      _$MangaConfigCopyWithImpl<$Res, MangaConfig>;
  @useResult
  $Res call(
      {@JsonKey(name: 'manga_id') String mangaId,
      String title,
      String? description,
      @JsonKey(name: 'cover_image') SingleImage? coverImage,
      List<AuthorData>? authors,
      List<FirebaseChapter> chapters});

  $SingleImageCopyWith<$Res>? get coverImage;
}

/// @nodoc
class _$MangaConfigCopyWithImpl<$Res, $Val extends MangaConfig>
    implements $MangaConfigCopyWith<$Res> {
  _$MangaConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MangaConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mangaId = null,
    Object? title = null,
    Object? description = freezed,
    Object? coverImage = freezed,
    Object? authors = freezed,
    Object? chapters = null,
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
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as SingleImage?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<AuthorData>?,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<FirebaseChapter>,
    ) as $Val);
  }

  /// Create a copy of MangaConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SingleImageCopyWith<$Res>? get coverImage {
    if (_value.coverImage == null) {
      return null;
    }

    return $SingleImageCopyWith<$Res>(_value.coverImage!, (value) {
      return _then(_value.copyWith(coverImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MangaConfigImplCopyWith<$Res>
    implements $MangaConfigCopyWith<$Res> {
  factory _$$MangaConfigImplCopyWith(
          _$MangaConfigImpl value, $Res Function(_$MangaConfigImpl) then) =
      __$$MangaConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'manga_id') String mangaId,
      String title,
      String? description,
      @JsonKey(name: 'cover_image') SingleImage? coverImage,
      List<AuthorData>? authors,
      List<FirebaseChapter> chapters});

  @override
  $SingleImageCopyWith<$Res>? get coverImage;
}

/// @nodoc
class __$$MangaConfigImplCopyWithImpl<$Res>
    extends _$MangaConfigCopyWithImpl<$Res, _$MangaConfigImpl>
    implements _$$MangaConfigImplCopyWith<$Res> {
  __$$MangaConfigImplCopyWithImpl(
      _$MangaConfigImpl _value, $Res Function(_$MangaConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of MangaConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mangaId = null,
    Object? title = null,
    Object? description = freezed,
    Object? coverImage = freezed,
    Object? authors = freezed,
    Object? chapters = null,
  }) {
    return _then(_$MangaConfigImpl(
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
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as SingleImage?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<AuthorData>?,
      chapters: null == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<FirebaseChapter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MangaConfigImpl implements _MangaConfig {
  const _$MangaConfigImpl(
      {@JsonKey(name: 'manga_id') required this.mangaId,
      required this.title,
      required this.description,
      @JsonKey(name: 'cover_image') required this.coverImage,
      required final List<AuthorData>? authors,
      required final List<FirebaseChapter> chapters})
      : _authors = authors,
        _chapters = chapters;

  factory _$MangaConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$MangaConfigImplFromJson(json);

  @override
  @JsonKey(name: 'manga_id')
  final String mangaId;
  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'cover_image')
  final SingleImage? coverImage;
  final List<AuthorData>? _authors;
  @override
  List<AuthorData>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FirebaseChapter> _chapters;
  @override
  List<FirebaseChapter> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  @override
  String toString() {
    return 'MangaConfig(mangaId: $mangaId, title: $title, description: $description, coverImage: $coverImage, authors: $authors, chapters: $chapters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaConfigImpl &&
            (identical(other.mangaId, mangaId) || other.mangaId == mangaId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mangaId,
      title,
      description,
      coverImage,
      const DeepCollectionEquality().hash(_authors),
      const DeepCollectionEquality().hash(_chapters));

  /// Create a copy of MangaConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MangaConfigImplCopyWith<_$MangaConfigImpl> get copyWith =>
      __$$MangaConfigImplCopyWithImpl<_$MangaConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MangaConfigImplToJson(
      this,
    );
  }
}

abstract class _MangaConfig implements MangaConfig {
  const factory _MangaConfig(
      {@JsonKey(name: 'manga_id') required final String mangaId,
      required final String title,
      required final String? description,
      @JsonKey(name: 'cover_image') required final SingleImage? coverImage,
      required final List<AuthorData>? authors,
      required final List<FirebaseChapter> chapters}) = _$MangaConfigImpl;

  factory _MangaConfig.fromJson(Map<String, dynamic> json) =
      _$MangaConfigImpl.fromJson;

  @override
  @JsonKey(name: 'manga_id')
  String get mangaId;
  @override
  String get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'cover_image')
  SingleImage? get coverImage;
  @override
  List<AuthorData>? get authors;
  @override
  List<FirebaseChapter> get chapters;

  /// Create a copy of MangaConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MangaConfigImplCopyWith<_$MangaConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthorData _$AuthorDataFromJson(Map<String, dynamic> json) {
  return _AuthorData.fromJson(json);
}

/// @nodoc
mixin _$AuthorData {
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  /// Serializes this AuthorData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthorData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorDataCopyWith<AuthorData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorDataCopyWith<$Res> {
  factory $AuthorDataCopyWith(
          AuthorData value, $Res Function(AuthorData) then) =
      _$AuthorDataCopyWithImpl<$Res, AuthorData>;
  @useResult
  $Res call({String name, String role});
}

/// @nodoc
class _$AuthorDataCopyWithImpl<$Res, $Val extends AuthorData>
    implements $AuthorDataCopyWith<$Res> {
  _$AuthorDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthorData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorDataImplCopyWith<$Res>
    implements $AuthorDataCopyWith<$Res> {
  factory _$$AuthorDataImplCopyWith(
          _$AuthorDataImpl value, $Res Function(_$AuthorDataImpl) then) =
      __$$AuthorDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String role});
}

/// @nodoc
class __$$AuthorDataImplCopyWithImpl<$Res>
    extends _$AuthorDataCopyWithImpl<$Res, _$AuthorDataImpl>
    implements _$$AuthorDataImplCopyWith<$Res> {
  __$$AuthorDataImplCopyWithImpl(
      _$AuthorDataImpl _value, $Res Function(_$AuthorDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthorData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? role = null,
  }) {
    return _then(_$AuthorDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorDataImpl implements _AuthorData {
  const _$AuthorDataImpl({required this.name, required this.role});

  factory _$AuthorDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorDataImplFromJson(json);

  @override
  final String name;
  @override
  final String role;

  @override
  String toString() {
    return 'AuthorData(name: $name, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, role);

  /// Create a copy of AuthorData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorDataImplCopyWith<_$AuthorDataImpl> get copyWith =>
      __$$AuthorDataImplCopyWithImpl<_$AuthorDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorDataImplToJson(
      this,
    );
  }
}

abstract class _AuthorData implements AuthorData {
  const factory _AuthorData(
      {required final String name,
      required final String role}) = _$AuthorDataImpl;

  factory _AuthorData.fromJson(Map<String, dynamic> json) =
      _$AuthorDataImpl.fromJson;

  @override
  String get name;
  @override
  String get role;

  /// Create a copy of AuthorData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorDataImplCopyWith<_$AuthorDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
