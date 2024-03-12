// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_info_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrainingInfo _$TrainingInfoFromJson(Map<String, dynamic> json) {
  return _TrainingInfo.fromJson(json);
}

/// @nodoc
mixin _$TrainingInfo {
  int get partsId => throw _privateConstructorUsedError;
  int get partsTrainingId => throw _privateConstructorUsedError;
  int get trainingId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get rm => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrainingInfoCopyWith<TrainingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingInfoCopyWith<$Res> {
  factory $TrainingInfoCopyWith(
          TrainingInfo value, $Res Function(TrainingInfo) then) =
      _$TrainingInfoCopyWithImpl<$Res, TrainingInfo>;
  @useResult
  $Res call(
      {int partsId,
      int partsTrainingId,
      int trainingId,
      DateTime date,
      double? weight,
      int? count,
      int? rm,
      String? memo});
}

/// @nodoc
class _$TrainingInfoCopyWithImpl<$Res, $Val extends TrainingInfo>
    implements $TrainingInfoCopyWith<$Res> {
  _$TrainingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partsId = null,
    Object? partsTrainingId = null,
    Object? trainingId = null,
    Object? date = null,
    Object? weight = freezed,
    Object? count = freezed,
    Object? rm = freezed,
    Object? memo = freezed,
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
      trainingId: null == trainingId
          ? _value.trainingId
          : trainingId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      rm: freezed == rm
          ? _value.rm
          : rm // ignore: cast_nullable_to_non_nullable
              as int?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrainingInfoImplCopyWith<$Res>
    implements $TrainingInfoCopyWith<$Res> {
  factory _$$TrainingInfoImplCopyWith(
          _$TrainingInfoImpl value, $Res Function(_$TrainingInfoImpl) then) =
      __$$TrainingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int partsId,
      int partsTrainingId,
      int trainingId,
      DateTime date,
      double? weight,
      int? count,
      int? rm,
      String? memo});
}

/// @nodoc
class __$$TrainingInfoImplCopyWithImpl<$Res>
    extends _$TrainingInfoCopyWithImpl<$Res, _$TrainingInfoImpl>
    implements _$$TrainingInfoImplCopyWith<$Res> {
  __$$TrainingInfoImplCopyWithImpl(
      _$TrainingInfoImpl _value, $Res Function(_$TrainingInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partsId = null,
    Object? partsTrainingId = null,
    Object? trainingId = null,
    Object? date = null,
    Object? weight = freezed,
    Object? count = freezed,
    Object? rm = freezed,
    Object? memo = freezed,
  }) {
    return _then(_$TrainingInfoImpl(
      partsId: null == partsId
          ? _value.partsId
          : partsId // ignore: cast_nullable_to_non_nullable
              as int,
      partsTrainingId: null == partsTrainingId
          ? _value.partsTrainingId
          : partsTrainingId // ignore: cast_nullable_to_non_nullable
              as int,
      trainingId: null == trainingId
          ? _value.trainingId
          : trainingId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      rm: freezed == rm
          ? _value.rm
          : rm // ignore: cast_nullable_to_non_nullable
              as int?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrainingInfoImpl implements _TrainingInfo {
  const _$TrainingInfoImpl(
      {required this.partsId,
      required this.partsTrainingId,
      required this.trainingId,
      required this.date,
      this.weight,
      this.count,
      this.rm,
      this.memo});

  factory _$TrainingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainingInfoImplFromJson(json);

  @override
  final int partsId;
  @override
  final int partsTrainingId;
  @override
  final int trainingId;
  @override
  final DateTime date;
  @override
  final double? weight;
  @override
  final int? count;
  @override
  final int? rm;
  @override
  final String? memo;

  @override
  String toString() {
    return 'TrainingInfo(partsId: $partsId, partsTrainingId: $partsTrainingId, trainingId: $trainingId, date: $date, weight: $weight, count: $count, rm: $rm, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingInfoImpl &&
            (identical(other.partsId, partsId) || other.partsId == partsId) &&
            (identical(other.partsTrainingId, partsTrainingId) ||
                other.partsTrainingId == partsTrainingId) &&
            (identical(other.trainingId, trainingId) ||
                other.trainingId == trainingId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.rm, rm) || other.rm == rm) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partsId, partsTrainingId,
      trainingId, date, weight, count, rm, memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingInfoImplCopyWith<_$TrainingInfoImpl> get copyWith =>
      __$$TrainingInfoImplCopyWithImpl<_$TrainingInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainingInfoImplToJson(
      this,
    );
  }
}

abstract class _TrainingInfo implements TrainingInfo {
  const factory _TrainingInfo(
      {required final int partsId,
      required final int partsTrainingId,
      required final int trainingId,
      required final DateTime date,
      final double? weight,
      final int? count,
      final int? rm,
      final String? memo}) = _$TrainingInfoImpl;

  factory _TrainingInfo.fromJson(Map<String, dynamic> json) =
      _$TrainingInfoImpl.fromJson;

  @override
  int get partsId;
  @override
  int get partsTrainingId;
  @override
  int get trainingId;
  @override
  DateTime get date;
  @override
  double? get weight;
  @override
  int? get count;
  @override
  int? get rm;
  @override
  String? get memo;
  @override
  @JsonKey(ignore: true)
  _$$TrainingInfoImplCopyWith<_$TrainingInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
