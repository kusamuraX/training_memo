// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'body_parts_mst_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BodyPartsMst _$BodyPartsMstFromJson(Map<String, dynamic> json) {
  return _BodyPartsMst.fromJson(json);
}

/// @nodoc
mixin _$BodyPartsMst {
  int get partsId => throw _privateConstructorUsedError;
  String get partsName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BodyPartsMstCopyWith<BodyPartsMst> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyPartsMstCopyWith<$Res> {
  factory $BodyPartsMstCopyWith(
          BodyPartsMst value, $Res Function(BodyPartsMst) then) =
      _$BodyPartsMstCopyWithImpl<$Res, BodyPartsMst>;
  @useResult
  $Res call({int partsId, String partsName});
}

/// @nodoc
class _$BodyPartsMstCopyWithImpl<$Res, $Val extends BodyPartsMst>
    implements $BodyPartsMstCopyWith<$Res> {
  _$BodyPartsMstCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partsId = null,
    Object? partsName = null,
  }) {
    return _then(_value.copyWith(
      partsId: null == partsId
          ? _value.partsId
          : partsId // ignore: cast_nullable_to_non_nullable
              as int,
      partsName: null == partsName
          ? _value.partsName
          : partsName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BodyPartsMstImplCopyWith<$Res>
    implements $BodyPartsMstCopyWith<$Res> {
  factory _$$BodyPartsMstImplCopyWith(
          _$BodyPartsMstImpl value, $Res Function(_$BodyPartsMstImpl) then) =
      __$$BodyPartsMstImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int partsId, String partsName});
}

/// @nodoc
class __$$BodyPartsMstImplCopyWithImpl<$Res>
    extends _$BodyPartsMstCopyWithImpl<$Res, _$BodyPartsMstImpl>
    implements _$$BodyPartsMstImplCopyWith<$Res> {
  __$$BodyPartsMstImplCopyWithImpl(
      _$BodyPartsMstImpl _value, $Res Function(_$BodyPartsMstImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partsId = null,
    Object? partsName = null,
  }) {
    return _then(_$BodyPartsMstImpl(
      partsId: null == partsId
          ? _value.partsId
          : partsId // ignore: cast_nullable_to_non_nullable
              as int,
      partsName: null == partsName
          ? _value.partsName
          : partsName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyPartsMstImpl implements _BodyPartsMst {
  const _$BodyPartsMstImpl({required this.partsId, required this.partsName});

  factory _$BodyPartsMstImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyPartsMstImplFromJson(json);

  @override
  final int partsId;
  @override
  final String partsName;

  @override
  String toString() {
    return 'BodyPartsMst(partsId: $partsId, partsName: $partsName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyPartsMstImpl &&
            (identical(other.partsId, partsId) || other.partsId == partsId) &&
            (identical(other.partsName, partsName) ||
                other.partsName == partsName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partsId, partsName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyPartsMstImplCopyWith<_$BodyPartsMstImpl> get copyWith =>
      __$$BodyPartsMstImplCopyWithImpl<_$BodyPartsMstImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyPartsMstImplToJson(
      this,
    );
  }
}

abstract class _BodyPartsMst implements BodyPartsMst {
  const factory _BodyPartsMst(
      {required final int partsId,
      required final String partsName}) = _$BodyPartsMstImpl;

  factory _BodyPartsMst.fromJson(Map<String, dynamic> json) =
      _$BodyPartsMstImpl.fromJson;

  @override
  int get partsId;
  @override
  String get partsName;
  @override
  @JsonKey(ignore: true)
  _$$BodyPartsMstImplCopyWith<_$BodyPartsMstImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
