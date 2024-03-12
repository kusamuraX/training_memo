// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainPageModel {
  DateTime get today => throw _privateConstructorUsedError;
  double get maxScale => throw _privateConstructorUsedError;
  List<BodyPartsMst> get bodyPartsList => throw _privateConstructorUsedError;
  List<PartsWeight> get weekWeightList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainPageModelCopyWith<MainPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainPageModelCopyWith<$Res> {
  factory $MainPageModelCopyWith(
          MainPageModel value, $Res Function(MainPageModel) then) =
      _$MainPageModelCopyWithImpl<$Res, MainPageModel>;
  @useResult
  $Res call(
      {DateTime today,
      double maxScale,
      List<BodyPartsMst> bodyPartsList,
      List<PartsWeight> weekWeightList});
}

/// @nodoc
class _$MainPageModelCopyWithImpl<$Res, $Val extends MainPageModel>
    implements $MainPageModelCopyWith<$Res> {
  _$MainPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = null,
    Object? maxScale = null,
    Object? bodyPartsList = null,
    Object? weekWeightList = null,
  }) {
    return _then(_value.copyWith(
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maxScale: null == maxScale
          ? _value.maxScale
          : maxScale // ignore: cast_nullable_to_non_nullable
              as double,
      bodyPartsList: null == bodyPartsList
          ? _value.bodyPartsList
          : bodyPartsList // ignore: cast_nullable_to_non_nullable
              as List<BodyPartsMst>,
      weekWeightList: null == weekWeightList
          ? _value.weekWeightList
          : weekWeightList // ignore: cast_nullable_to_non_nullable
              as List<PartsWeight>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainPageModelImplCopyWith<$Res>
    implements $MainPageModelCopyWith<$Res> {
  factory _$$MainPageModelImplCopyWith(
          _$MainPageModelImpl value, $Res Function(_$MainPageModelImpl) then) =
      __$$MainPageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime today,
      double maxScale,
      List<BodyPartsMst> bodyPartsList,
      List<PartsWeight> weekWeightList});
}

/// @nodoc
class __$$MainPageModelImplCopyWithImpl<$Res>
    extends _$MainPageModelCopyWithImpl<$Res, _$MainPageModelImpl>
    implements _$$MainPageModelImplCopyWith<$Res> {
  __$$MainPageModelImplCopyWithImpl(
      _$MainPageModelImpl _value, $Res Function(_$MainPageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = null,
    Object? maxScale = null,
    Object? bodyPartsList = null,
    Object? weekWeightList = null,
  }) {
    return _then(_$MainPageModelImpl(
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maxScale: null == maxScale
          ? _value.maxScale
          : maxScale // ignore: cast_nullable_to_non_nullable
              as double,
      bodyPartsList: null == bodyPartsList
          ? _value._bodyPartsList
          : bodyPartsList // ignore: cast_nullable_to_non_nullable
              as List<BodyPartsMst>,
      weekWeightList: null == weekWeightList
          ? _value._weekWeightList
          : weekWeightList // ignore: cast_nullable_to_non_nullable
              as List<PartsWeight>,
    ));
  }
}

/// @nodoc

class _$MainPageModelImpl implements _MainPageModel {
  const _$MainPageModelImpl(
      {required this.today,
      required this.maxScale,
      required final List<BodyPartsMst> bodyPartsList,
      required final List<PartsWeight> weekWeightList})
      : _bodyPartsList = bodyPartsList,
        _weekWeightList = weekWeightList;

  @override
  final DateTime today;
  @override
  final double maxScale;
  final List<BodyPartsMst> _bodyPartsList;
  @override
  List<BodyPartsMst> get bodyPartsList {
    if (_bodyPartsList is EqualUnmodifiableListView) return _bodyPartsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bodyPartsList);
  }

  final List<PartsWeight> _weekWeightList;
  @override
  List<PartsWeight> get weekWeightList {
    if (_weekWeightList is EqualUnmodifiableListView) return _weekWeightList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekWeightList);
  }

  @override
  String toString() {
    return 'MainPageModel(today: $today, maxScale: $maxScale, bodyPartsList: $bodyPartsList, weekWeightList: $weekWeightList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainPageModelImpl &&
            (identical(other.today, today) || other.today == today) &&
            (identical(other.maxScale, maxScale) ||
                other.maxScale == maxScale) &&
            const DeepCollectionEquality()
                .equals(other._bodyPartsList, _bodyPartsList) &&
            const DeepCollectionEquality()
                .equals(other._weekWeightList, _weekWeightList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      today,
      maxScale,
      const DeepCollectionEquality().hash(_bodyPartsList),
      const DeepCollectionEquality().hash(_weekWeightList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainPageModelImplCopyWith<_$MainPageModelImpl> get copyWith =>
      __$$MainPageModelImplCopyWithImpl<_$MainPageModelImpl>(this, _$identity);
}

abstract class _MainPageModel implements MainPageModel {
  const factory _MainPageModel(
      {required final DateTime today,
      required final double maxScale,
      required final List<BodyPartsMst> bodyPartsList,
      required final List<PartsWeight> weekWeightList}) = _$MainPageModelImpl;

  @override
  DateTime get today;
  @override
  double get maxScale;
  @override
  List<BodyPartsMst> get bodyPartsList;
  @override
  List<PartsWeight> get weekWeightList;
  @override
  @JsonKey(ignore: true)
  _$$MainPageModelImplCopyWith<_$MainPageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
