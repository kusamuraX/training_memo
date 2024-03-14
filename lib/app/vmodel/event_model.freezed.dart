// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventModel {
  int get partsId => throw _privateConstructorUsedError;
  String get partsName => throw _privateConstructorUsedError;
  Map<String, List> get trainingMap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res, EventModel>;
  @useResult
  $Res call({int partsId, String partsName, Map<String, List> trainingMap});
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res, $Val extends EventModel>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partsId = null,
    Object? partsName = null,
    Object? trainingMap = null,
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
      trainingMap: null == trainingMap
          ? _value.trainingMap
          : trainingMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventModelImplCopyWith<$Res>
    implements $EventModelCopyWith<$Res> {
  factory _$$EventModelImplCopyWith(
          _$EventModelImpl value, $Res Function(_$EventModelImpl) then) =
      __$$EventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int partsId, String partsName, Map<String, List> trainingMap});
}

/// @nodoc
class __$$EventModelImplCopyWithImpl<$Res>
    extends _$EventModelCopyWithImpl<$Res, _$EventModelImpl>
    implements _$$EventModelImplCopyWith<$Res> {
  __$$EventModelImplCopyWithImpl(
      _$EventModelImpl _value, $Res Function(_$EventModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partsId = null,
    Object? partsName = null,
    Object? trainingMap = null,
  }) {
    return _then(_$EventModelImpl(
      partsId: null == partsId
          ? _value.partsId
          : partsId // ignore: cast_nullable_to_non_nullable
              as int,
      partsName: null == partsName
          ? _value.partsName
          : partsName // ignore: cast_nullable_to_non_nullable
              as String,
      trainingMap: null == trainingMap
          ? _value._trainingMap
          : trainingMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List>,
    ));
  }
}

/// @nodoc

class _$EventModelImpl implements _EventModel {
  const _$EventModelImpl(
      {required this.partsId,
      required this.partsName,
      required final Map<String, List> trainingMap})
      : _trainingMap = trainingMap;

  @override
  final int partsId;
  @override
  final String partsName;
  final Map<String, List> _trainingMap;
  @override
  Map<String, List> get trainingMap {
    if (_trainingMap is EqualUnmodifiableMapView) return _trainingMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_trainingMap);
  }

  @override
  String toString() {
    return 'EventModel(partsId: $partsId, partsName: $partsName, trainingMap: $trainingMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventModelImpl &&
            (identical(other.partsId, partsId) || other.partsId == partsId) &&
            (identical(other.partsName, partsName) ||
                other.partsName == partsName) &&
            const DeepCollectionEquality()
                .equals(other._trainingMap, _trainingMap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partsId, partsName,
      const DeepCollectionEquality().hash(_trainingMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      __$$EventModelImplCopyWithImpl<_$EventModelImpl>(this, _$identity);
}

abstract class _EventModel implements EventModel {
  const factory _EventModel(
      {required final int partsId,
      required final String partsName,
      required final Map<String, List> trainingMap}) = _$EventModelImpl;

  @override
  int get partsId;
  @override
  String get partsName;
  @override
  Map<String, List> get trainingMap;
  @override
  @JsonKey(ignore: true)
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
