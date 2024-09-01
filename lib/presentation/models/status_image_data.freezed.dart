// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_image_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatusImageData {
  ImageDataStatus get status => throw _privateConstructorUsedError;
  ImageData get image => throw _privateConstructorUsedError;

  /// Create a copy of StatusImageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusImageDataCopyWith<StatusImageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusImageDataCopyWith<$Res> {
  factory $StatusImageDataCopyWith(
          StatusImageData value, $Res Function(StatusImageData) then) =
      _$StatusImageDataCopyWithImpl<$Res, StatusImageData>;
  @useResult
  $Res call({ImageDataStatus status, ImageData image});
}

/// @nodoc
class _$StatusImageDataCopyWithImpl<$Res, $Val extends StatusImageData>
    implements $StatusImageDataCopyWith<$Res> {
  _$StatusImageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusImageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ImageDataStatus,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusImageDataImplCopyWith<$Res>
    implements $StatusImageDataCopyWith<$Res> {
  factory _$$StatusImageDataImplCopyWith(_$StatusImageDataImpl value,
          $Res Function(_$StatusImageDataImpl) then) =
      __$$StatusImageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageDataStatus status, ImageData image});
}

/// @nodoc
class __$$StatusImageDataImplCopyWithImpl<$Res>
    extends _$StatusImageDataCopyWithImpl<$Res, _$StatusImageDataImpl>
    implements _$$StatusImageDataImplCopyWith<$Res> {
  __$$StatusImageDataImplCopyWithImpl(
      _$StatusImageDataImpl _value, $Res Function(_$StatusImageDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatusImageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? image = null,
  }) {
    return _then(_$StatusImageDataImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ImageDataStatus,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageData,
    ));
  }
}

/// @nodoc

class _$StatusImageDataImpl implements _StatusImageData {
  const _$StatusImageDataImpl({required this.status, required this.image});

  @override
  final ImageDataStatus status;
  @override
  final ImageData image;

  @override
  String toString() {
    return 'StatusImageData(status: $status, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusImageDataImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, image);

  /// Create a copy of StatusImageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusImageDataImplCopyWith<_$StatusImageDataImpl> get copyWith =>
      __$$StatusImageDataImplCopyWithImpl<_$StatusImageDataImpl>(
          this, _$identity);
}

abstract class _StatusImageData implements StatusImageData {
  const factory _StatusImageData(
      {required final ImageDataStatus status,
      required final ImageData image}) = _$StatusImageDataImpl;

  @override
  ImageDataStatus get status;
  @override
  ImageData get image;

  /// Create a copy of StatusImageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusImageDataImplCopyWith<_$StatusImageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
