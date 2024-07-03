// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_firebase_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalFirebaseOptions _$LocalFirebaseOptionsFromJson(Map<String, dynamic> json) {
  return _LocalFirebaseOptions.fromJson(json);
}

/// @nodoc
mixin _$LocalFirebaseOptions {
  String get apiKey => throw _privateConstructorUsedError;
  String get appId => throw _privateConstructorUsedError;
  String get messagingSenderId => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get authDomain => throw _privateConstructorUsedError;
  String get storageBucket => throw _privateConstructorUsedError;
  String get measurementId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalFirebaseOptionsCopyWith<LocalFirebaseOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalFirebaseOptionsCopyWith<$Res> {
  factory $LocalFirebaseOptionsCopyWith(LocalFirebaseOptions value,
          $Res Function(LocalFirebaseOptions) then) =
      _$LocalFirebaseOptionsCopyWithImpl<$Res, LocalFirebaseOptions>;
  @useResult
  $Res call(
      {String apiKey,
      String appId,
      String messagingSenderId,
      String projectId,
      String authDomain,
      String storageBucket,
      String measurementId});
}

/// @nodoc
class _$LocalFirebaseOptionsCopyWithImpl<$Res,
        $Val extends LocalFirebaseOptions>
    implements $LocalFirebaseOptionsCopyWith<$Res> {
  _$LocalFirebaseOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? appId = null,
    Object? messagingSenderId = null,
    Object? projectId = null,
    Object? authDomain = null,
    Object? storageBucket = null,
    Object? measurementId = null,
  }) {
    return _then(_value.copyWith(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      messagingSenderId: null == messagingSenderId
          ? _value.messagingSenderId
          : messagingSenderId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      authDomain: null == authDomain
          ? _value.authDomain
          : authDomain // ignore: cast_nullable_to_non_nullable
              as String,
      storageBucket: null == storageBucket
          ? _value.storageBucket
          : storageBucket // ignore: cast_nullable_to_non_nullable
              as String,
      measurementId: null == measurementId
          ? _value.measurementId
          : measurementId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalFirebaseOptionsImplCopyWith<$Res>
    implements $LocalFirebaseOptionsCopyWith<$Res> {
  factory _$$LocalFirebaseOptionsImplCopyWith(_$LocalFirebaseOptionsImpl value,
          $Res Function(_$LocalFirebaseOptionsImpl) then) =
      __$$LocalFirebaseOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String apiKey,
      String appId,
      String messagingSenderId,
      String projectId,
      String authDomain,
      String storageBucket,
      String measurementId});
}

/// @nodoc
class __$$LocalFirebaseOptionsImplCopyWithImpl<$Res>
    extends _$LocalFirebaseOptionsCopyWithImpl<$Res, _$LocalFirebaseOptionsImpl>
    implements _$$LocalFirebaseOptionsImplCopyWith<$Res> {
  __$$LocalFirebaseOptionsImplCopyWithImpl(_$LocalFirebaseOptionsImpl _value,
      $Res Function(_$LocalFirebaseOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? appId = null,
    Object? messagingSenderId = null,
    Object? projectId = null,
    Object? authDomain = null,
    Object? storageBucket = null,
    Object? measurementId = null,
  }) {
    return _then(_$LocalFirebaseOptionsImpl(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      messagingSenderId: null == messagingSenderId
          ? _value.messagingSenderId
          : messagingSenderId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      authDomain: null == authDomain
          ? _value.authDomain
          : authDomain // ignore: cast_nullable_to_non_nullable
              as String,
      storageBucket: null == storageBucket
          ? _value.storageBucket
          : storageBucket // ignore: cast_nullable_to_non_nullable
              as String,
      measurementId: null == measurementId
          ? _value.measurementId
          : measurementId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalFirebaseOptionsImpl implements _LocalFirebaseOptions {
  _$LocalFirebaseOptionsImpl(
      {required this.apiKey,
      required this.appId,
      required this.messagingSenderId,
      required this.projectId,
      required this.authDomain,
      required this.storageBucket,
      required this.measurementId});

  factory _$LocalFirebaseOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalFirebaseOptionsImplFromJson(json);

  @override
  final String apiKey;
  @override
  final String appId;
  @override
  final String messagingSenderId;
  @override
  final String projectId;
  @override
  final String authDomain;
  @override
  final String storageBucket;
  @override
  final String measurementId;

  @override
  String toString() {
    return 'LocalFirebaseOptions(apiKey: $apiKey, appId: $appId, messagingSenderId: $messagingSenderId, projectId: $projectId, authDomain: $authDomain, storageBucket: $storageBucket, measurementId: $measurementId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalFirebaseOptionsImpl &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.messagingSenderId, messagingSenderId) ||
                other.messagingSenderId == messagingSenderId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.authDomain, authDomain) ||
                other.authDomain == authDomain) &&
            (identical(other.storageBucket, storageBucket) ||
                other.storageBucket == storageBucket) &&
            (identical(other.measurementId, measurementId) ||
                other.measurementId == measurementId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, apiKey, appId, messagingSenderId,
      projectId, authDomain, storageBucket, measurementId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalFirebaseOptionsImplCopyWith<_$LocalFirebaseOptionsImpl>
      get copyWith =>
          __$$LocalFirebaseOptionsImplCopyWithImpl<_$LocalFirebaseOptionsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalFirebaseOptionsImplToJson(
      this,
    );
  }
}

abstract class _LocalFirebaseOptions implements LocalFirebaseOptions {
  factory _LocalFirebaseOptions(
      {required final String apiKey,
      required final String appId,
      required final String messagingSenderId,
      required final String projectId,
      required final String authDomain,
      required final String storageBucket,
      required final String measurementId}) = _$LocalFirebaseOptionsImpl;

  factory _LocalFirebaseOptions.fromJson(Map<String, dynamic> json) =
      _$LocalFirebaseOptionsImpl.fromJson;

  @override
  String get apiKey;
  @override
  String get appId;
  @override
  String get messagingSenderId;
  @override
  String get projectId;
  @override
  String get authDomain;
  @override
  String get storageBucket;
  @override
  String get measurementId;
  @override
  @JsonKey(ignore: true)
  _$$LocalFirebaseOptionsImplCopyWith<_$LocalFirebaseOptionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
