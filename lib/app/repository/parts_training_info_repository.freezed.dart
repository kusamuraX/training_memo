// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parts_training_info_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PartsTrainingInfo _$PartsTrainingInfoFromJson(Map<String, dynamic> json) {
  return _PartsTrainingInfo.fromJson(json);
}

/// @nodoc
mixin _$PartsTrainingInfo {
  int get partsId => throw _privateConstructorUsedError;
  int get partsTrainingId => throw _privateConstructorUsedError;
  String get trainingName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartsTrainingInfoCopyWith<PartsTrainingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartsTrainingInfoCopyWith<$Res> {
  factory $PartsTrainingInfoCopyWith(
          PartsTrainingInfo value, $Res Function(PartsTrainingInfo) then) =
      _$PartsTrainingInfoCopyWithImpl<$Res, PartsTrainingInfo>;
  @useResult
  $Res call({int partsId, int partsTrainingId, String trainingName});
}

/// @nodoc
class _$PartsTrainingInfoCopyWithImpl<$Res, $Val extends PartsTrainingInfo>
    implements $PartsTrainingInfoCopyWith<$Res> {
  _$PartsTrainingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partsId = null,
    Object? partsTrainingId = null,
    Object? trainingName = null,
  }) {
    return _then(_value.copyWith(
      partsId: null == partsId
          ? _value.partsId
          : partsId // ignore: cast_nullable_to_non_nullable
              as int,
      partsTrainingId: null == partsTrainingId
          ? _value.partsTrainingId
          : partsTrainingId // ignore: cast_nullable_to_non_nullable
              as int,
      trainingName: null == trainingName
          ? _value.trainingName
          : trainingName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartsTrainingInfoImplCopyWith<$Res>
    implements $PartsTrainingInfoCopyWith<$Res> {
  factory _$$PartsTrainingInfoImplCopyWith(_$PartsTrainingInfoImpl value,
          $Res Function(_$PartsTrainingInfoImpl) then) =
      __$$PartsTrainingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int partsId, int partsTrainingId, String trainingName});
}

/// @nodoc
class __$$PartsTrainingInfoImplCopyWithImpl<$Res>
    extends _$PartsTrainingInfoCopyWithImpl<$Res, _$PartsTrainingInfoImpl>
    implements _$$PartsTrainingInfoImplCopyWith<$Res> {
  __$$PartsTrainingInfoImplCopyWithImpl(_$PartsTrainingInfoImpl _value,
      $Res Function(_$PartsTrainingInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partsId = null,
    Object? partsTrainingId = null,
    Object? trainingName = null,
  }) {
    return _then(_$PartsTrainingInfoImpl(
      partsId: null == partsId
          ? _value.partsId
          : partsId // ignore: cast_nullable_to_non_nullable
              as int,
      partsTrainingId: null == partsTrainingId
          ? _value.partsTrainingId
          : partsTrainingId // ignore: cast_nullable_to_non_nullable
              as int,
      trainingName: null == trainingName
          ? _value.trainingName
          : trainingName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartsTrainingInfoImpl implements _PartsTrainingInfo {
  const _$PartsTrainingInfoImpl(
      {required this.partsId,
      required this.partsTrainingId,
      required this.trainingName});

  factory _$PartsTrainingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartsTrainingInfoImplFromJson(json);

  @override
  final int partsId;
  @override
  final int partsTrainingId;
  @override
  final String trainingName;

  @override
  String toString() {
    return 'PartsTrainingInfo(partsId: $partsId, partsTrainingId: $partsTrainingId, trainingName: $trainingName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartsTrainingInfoImpl &&
            (identical(other.partsId, partsId) || other.partsId == partsId) &&
            (identical(other.partsTrainingId, partsTrainingId) ||
                other.partsTrainingId == partsTrainingId) &&
            (identical(other.trainingName, trainingName) ||
                other.trainingName == trainingName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, partsId, partsTrainingId, trainingName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartsTrainingInfoImplCopyWith<_$PartsTrainingInfoImpl> get copyWith =>
      __$$PartsTrainingInfoImplCopyWithImpl<_$PartsTrainingInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartsTrainingInfoImplToJson(
      this,
    );
  }
}

abstract class _PartsTrainingInfo implements PartsTrainingInfo {
  const factory _PartsTrainingInfo(
      {required final int partsId,
      required final int partsTrainingId,
      required final String trainingName}) = _$PartsTrainingInfoImpl;

  factory _PartsTrainingInfo.fromJson(Map<String, dynamic> json) =
      _$PartsTrainingInfoImpl.fromJson;

  @override
  int get partsId;
  @override
  int get partsTrainingId;
  @override
  String get trainingName;
  @override
  @JsonKey(ignore: true)
  _$$PartsTrainingInfoImplCopyWith<_$PartsTrainingInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
