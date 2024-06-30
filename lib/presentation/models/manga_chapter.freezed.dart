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
  String? get name => throw _privateConstructorUsedError;
  List<StatusImageData> get pageImages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MangaChapterCopyWith<MangaChapter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaChapterCopyWith<$Res> {
  factory $MangaChapterCopyWith(
          MangaChapter value, $Res Function(MangaChapter) then) =
      _$MangaChapterCopyWithImpl<$Res, MangaChapter>;
  @useResult
  $Res call({String? name, List<StatusImageData> pageImages});
}

/// @nodoc
class _$MangaChapterCopyWithImpl<$Res, $Val extends MangaChapter>
    implements $MangaChapterCopyWith<$Res> {
  _$MangaChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? pageImages = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pageImages: null == pageImages
          ? _value.pageImages
          : pageImages // ignore: cast_nullable_to_non_nullable
              as List<StatusImageData>,
    ) as $Val);
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
  $Res call({String? name, List<StatusImageData> pageImages});
}

/// @nodoc
class __$$MangaChapterImplCopyWithImpl<$Res>
    extends _$MangaChapterCopyWithImpl<$Res, _$MangaChapterImpl>
    implements _$$MangaChapterImplCopyWith<$Res> {
  __$$MangaChapterImplCopyWithImpl(
      _$MangaChapterImpl _value, $Res Function(_$MangaChapterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? pageImages = null,
  }) {
    return _then(_$MangaChapterImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pageImages: null == pageImages
          ? _value._pageImages
          : pageImages // ignore: cast_nullable_to_non_nullable
              as List<StatusImageData>,
    ));
  }
}

/// @nodoc

class _$MangaChapterImpl implements _MangaChapter {
  const _$MangaChapterImpl(
      {required this.name, required final List<StatusImageData> pageImages})
      : _pageImages = pageImages;

  @override
  final String? name;
  final List<StatusImageData> _pageImages;
  @override
  List<StatusImageData> get pageImages {
    if (_pageImages is EqualUnmodifiableListView) return _pageImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pageImages);
  }

  @override
  String toString() {
    return 'MangaChapter(name: $name, pageImages: $pageImages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaChapterImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._pageImages, _pageImages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_pageImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MangaChapterImplCopyWith<_$MangaChapterImpl> get copyWith =>
      __$$MangaChapterImplCopyWithImpl<_$MangaChapterImpl>(this, _$identity);
}

abstract class _MangaChapter implements MangaChapter {
  const factory _MangaChapter(
      {required final String? name,
      required final List<StatusImageData> pageImages}) = _$MangaChapterImpl;

  @override
  String? get name;
  @override
  List<StatusImageData> get pageImages;
  @override
  @JsonKey(ignore: true)
  _$$MangaChapterImplCopyWith<_$MangaChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
