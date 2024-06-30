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
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'files_names')
  List<String> get filesNames => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      {String? name, @JsonKey(name: 'files_names') List<String> filesNames});
}

/// @nodoc
class _$FirebaseChapterCopyWithImpl<$Res, $Val extends FirebaseChapter>
    implements $FirebaseChapterCopyWith<$Res> {
  _$FirebaseChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? filesNames = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      filesNames: null == filesNames
          ? _value.filesNames
          : filesNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
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
      {String? name, @JsonKey(name: 'files_names') List<String> filesNames});
}

/// @nodoc
class __$$FirebaseChapterImplCopyWithImpl<$Res>
    extends _$FirebaseChapterCopyWithImpl<$Res, _$FirebaseChapterImpl>
    implements _$$FirebaseChapterImplCopyWith<$Res> {
  __$$FirebaseChapterImplCopyWithImpl(
      _$FirebaseChapterImpl _value, $Res Function(_$FirebaseChapterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? filesNames = null,
  }) {
    return _then(_$FirebaseChapterImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      filesNames: null == filesNames
          ? _value._filesNames
          : filesNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirebaseChapterImpl implements _FirebaseChapter {
  _$FirebaseChapterImpl(
      {required this.name,
      @JsonKey(name: 'files_names') required final List<String> filesNames})
      : _filesNames = filesNames;

  factory _$FirebaseChapterImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirebaseChapterImplFromJson(json);

  @override
  final String? name;
  final List<String> _filesNames;
  @override
  @JsonKey(name: 'files_names')
  List<String> get filesNames {
    if (_filesNames is EqualUnmodifiableListView) return _filesNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filesNames);
  }

  @override
  String toString() {
    return 'FirebaseChapter(name: $name, filesNames: $filesNames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseChapterImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._filesNames, _filesNames));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_filesNames));

  @JsonKey(ignore: true)
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
  factory _FirebaseChapter(
      {required final String? name,
      @JsonKey(name: 'files_names')
      required final List<String> filesNames}) = _$FirebaseChapterImpl;

  factory _FirebaseChapter.fromJson(Map<String, dynamic> json) =
      _$FirebaseChapterImpl.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(name: 'files_names')
  List<String> get filesNames;
  @override
  @JsonKey(ignore: true)
  _$$FirebaseChapterImplCopyWith<_$FirebaseChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
