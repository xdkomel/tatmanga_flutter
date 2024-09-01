// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SingleImage _$SingleImageFromJson(Map<String, dynamic> json) {
  switch (json['image_type']) {
    case 'url':
      return SingleImageUrl.fromJson(json);
    case 'firebase_file':
      return SingleImageFirebaseFile.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'image_type', 'SingleImage',
          'Invalid union type "${json['image_type']}"!');
  }
}

/// @nodoc
mixin _$SingleImage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) url,
    required TResult Function(@JsonKey(name: 'file_name') String fileName)
        firebaseFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? url,
    TResult? Function(@JsonKey(name: 'file_name') String fileName)?
        firebaseFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? url,
    TResult Function(@JsonKey(name: 'file_name') String fileName)? firebaseFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SingleImageUrl value) url,
    required TResult Function(SingleImageFirebaseFile value) firebaseFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleImageUrl value)? url,
    TResult? Function(SingleImageFirebaseFile value)? firebaseFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleImageUrl value)? url,
    TResult Function(SingleImageFirebaseFile value)? firebaseFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this SingleImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleImageCopyWith<$Res> {
  factory $SingleImageCopyWith(
          SingleImage value, $Res Function(SingleImage) then) =
      _$SingleImageCopyWithImpl<$Res, SingleImage>;
}

/// @nodoc
class _$SingleImageCopyWithImpl<$Res, $Val extends SingleImage>
    implements $SingleImageCopyWith<$Res> {
  _$SingleImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SingleImage
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SingleImageUrlImplCopyWith<$Res> {
  factory _$$SingleImageUrlImplCopyWith(_$SingleImageUrlImpl value,
          $Res Function(_$SingleImageUrlImpl) then) =
      __$$SingleImageUrlImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$SingleImageUrlImplCopyWithImpl<$Res>
    extends _$SingleImageCopyWithImpl<$Res, _$SingleImageUrlImpl>
    implements _$$SingleImageUrlImplCopyWith<$Res> {
  __$$SingleImageUrlImplCopyWithImpl(
      _$SingleImageUrlImpl _value, $Res Function(_$SingleImageUrlImpl) _then)
      : super(_value, _then);

  /// Create a copy of SingleImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$SingleImageUrlImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleImageUrlImpl implements SingleImageUrl {
  const _$SingleImageUrlImpl({required this.url, final String? $type})
      : $type = $type ?? 'url';

  factory _$SingleImageUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleImageUrlImplFromJson(json);

  @override
  final String url;

  @JsonKey(name: 'image_type')
  final String $type;

  @override
  String toString() {
    return 'SingleImage.url(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleImageUrlImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of SingleImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleImageUrlImplCopyWith<_$SingleImageUrlImpl> get copyWith =>
      __$$SingleImageUrlImplCopyWithImpl<_$SingleImageUrlImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) url,
    required TResult Function(@JsonKey(name: 'file_name') String fileName)
        firebaseFile,
  }) {
    return url(this.url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? url,
    TResult? Function(@JsonKey(name: 'file_name') String fileName)?
        firebaseFile,
  }) {
    return url?.call(this.url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? url,
    TResult Function(@JsonKey(name: 'file_name') String fileName)? firebaseFile,
    required TResult orElse(),
  }) {
    if (url != null) {
      return url(this.url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SingleImageUrl value) url,
    required TResult Function(SingleImageFirebaseFile value) firebaseFile,
  }) {
    return url(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleImageUrl value)? url,
    TResult? Function(SingleImageFirebaseFile value)? firebaseFile,
  }) {
    return url?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleImageUrl value)? url,
    TResult Function(SingleImageFirebaseFile value)? firebaseFile,
    required TResult orElse(),
  }) {
    if (url != null) {
      return url(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleImageUrlImplToJson(
      this,
    );
  }
}

abstract class SingleImageUrl implements SingleImage {
  const factory SingleImageUrl({required final String url}) =
      _$SingleImageUrlImpl;

  factory SingleImageUrl.fromJson(Map<String, dynamic> json) =
      _$SingleImageUrlImpl.fromJson;

  String get url;

  /// Create a copy of SingleImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SingleImageUrlImplCopyWith<_$SingleImageUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SingleImageFirebaseFileImplCopyWith<$Res> {
  factory _$$SingleImageFirebaseFileImplCopyWith(
          _$SingleImageFirebaseFileImpl value,
          $Res Function(_$SingleImageFirebaseFileImpl) then) =
      __$$SingleImageFirebaseFileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({@JsonKey(name: 'file_name') String fileName});
}

/// @nodoc
class __$$SingleImageFirebaseFileImplCopyWithImpl<$Res>
    extends _$SingleImageCopyWithImpl<$Res, _$SingleImageFirebaseFileImpl>
    implements _$$SingleImageFirebaseFileImplCopyWith<$Res> {
  __$$SingleImageFirebaseFileImplCopyWithImpl(
      _$SingleImageFirebaseFileImpl _value,
      $Res Function(_$SingleImageFirebaseFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of SingleImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
  }) {
    return _then(_$SingleImageFirebaseFileImpl(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleImageFirebaseFileImpl implements SingleImageFirebaseFile {
  const _$SingleImageFirebaseFileImpl(
      {@JsonKey(name: 'file_name') required this.fileName, final String? $type})
      : $type = $type ?? 'firebase_file';

  factory _$SingleImageFirebaseFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleImageFirebaseFileImplFromJson(json);

  @override
  @JsonKey(name: 'file_name')
  final String fileName;

  @JsonKey(name: 'image_type')
  final String $type;

  @override
  String toString() {
    return 'SingleImage.firebaseFile(fileName: $fileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleImageFirebaseFileImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileName);

  /// Create a copy of SingleImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleImageFirebaseFileImplCopyWith<_$SingleImageFirebaseFileImpl>
      get copyWith => __$$SingleImageFirebaseFileImplCopyWithImpl<
          _$SingleImageFirebaseFileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) url,
    required TResult Function(@JsonKey(name: 'file_name') String fileName)
        firebaseFile,
  }) {
    return firebaseFile(fileName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? url,
    TResult? Function(@JsonKey(name: 'file_name') String fileName)?
        firebaseFile,
  }) {
    return firebaseFile?.call(fileName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? url,
    TResult Function(@JsonKey(name: 'file_name') String fileName)? firebaseFile,
    required TResult orElse(),
  }) {
    if (firebaseFile != null) {
      return firebaseFile(fileName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SingleImageUrl value) url,
    required TResult Function(SingleImageFirebaseFile value) firebaseFile,
  }) {
    return firebaseFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleImageUrl value)? url,
    TResult? Function(SingleImageFirebaseFile value)? firebaseFile,
  }) {
    return firebaseFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleImageUrl value)? url,
    TResult Function(SingleImageFirebaseFile value)? firebaseFile,
    required TResult orElse(),
  }) {
    if (firebaseFile != null) {
      return firebaseFile(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleImageFirebaseFileImplToJson(
      this,
    );
  }
}

abstract class SingleImageFirebaseFile implements SingleImage {
  const factory SingleImageFirebaseFile(
          {@JsonKey(name: 'file_name') required final String fileName}) =
      _$SingleImageFirebaseFileImpl;

  factory SingleImageFirebaseFile.fromJson(Map<String, dynamic> json) =
      _$SingleImageFirebaseFileImpl.fromJson;

  @JsonKey(name: 'file_name')
  String get fileName;

  /// Create a copy of SingleImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SingleImageFirebaseFileImplCopyWith<_$SingleImageFirebaseFileImpl>
      get copyWith => throw _privateConstructorUsedError;
}
