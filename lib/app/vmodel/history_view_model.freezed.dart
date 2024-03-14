// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryDataViewModel {
  DateTime get selectDate => throw _privateConstructorUsedError;
  LinkedHashMap<DateTime, List> get historyDataMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryDataViewModelCopyWith<HistoryDataViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryDataViewModelCopyWith<$Res> {
  factory $HistoryDataViewModelCopyWith(HistoryDataViewModel value,
          $Res Function(HistoryDataViewModel) then) =
      _$HistoryDataViewModelCopyWithImpl<$Res, HistoryDataViewModel>;
  @useResult
  $Res call(
      {DateTime selectDate, LinkedHashMap<DateTime, List> historyDataMap});
}

/// @nodoc
class _$HistoryDataViewModelCopyWithImpl<$Res,
        $Val extends HistoryDataViewModel>
    implements $HistoryDataViewModelCopyWith<$Res> {
  _$HistoryDataViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectDate = null,
    Object? historyDataMap = null,
  }) {
    return _then(_value.copyWith(
      selectDate: null == selectDate
          ? _value.selectDate
          : selectDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      historyDataMap: null == historyDataMap
          ? _value.historyDataMap
          : historyDataMap // ignore: cast_nullable_to_non_nullable
              as LinkedHashMap<DateTime, List>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryDataViewModelImplCopyWith<$Res>
    implements $HistoryDataViewModelCopyWith<$Res> {
  factory _$$HistoryDataViewModelImplCopyWith(_$HistoryDataViewModelImpl value,
          $Res Function(_$HistoryDataViewModelImpl) then) =
      __$$HistoryDataViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime selectDate, LinkedHashMap<DateTime, List> historyDataMap});
}

/// @nodoc
class __$$HistoryDataViewModelImplCopyWithImpl<$Res>
    extends _$HistoryDataViewModelCopyWithImpl<$Res, _$HistoryDataViewModelImpl>
    implements _$$HistoryDataViewModelImplCopyWith<$Res> {
  __$$HistoryDataViewModelImplCopyWithImpl(_$HistoryDataViewModelImpl _value,
      $Res Function(_$HistoryDataViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectDate = null,
    Object? historyDataMap = null,
  }) {
    return _then(_$HistoryDataViewModelImpl(
      selectDate: null == selectDate
          ? _value.selectDate
          : selectDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      historyDataMap: null == historyDataMap
          ? _value.historyDataMap
          : historyDataMap // ignore: cast_nullable_to_non_nullable
              as LinkedHashMap<DateTime, List>,
    ));
  }
}

/// @nodoc

class _$HistoryDataViewModelImpl implements _HistoryDataViewModel {
  const _$HistoryDataViewModelImpl(
      {required this.selectDate, required this.historyDataMap});

  @override
  final DateTime selectDate;
  @override
  final LinkedHashMap<DateTime, List> historyDataMap;

  @override
  String toString() {
    return 'HistoryDataViewModel(selectDate: $selectDate, historyDataMap: $historyDataMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryDataViewModelImpl &&
            (identical(other.selectDate, selectDate) ||
                other.selectDate == selectDate) &&
            const DeepCollectionEquality()
                .equals(other.historyDataMap, historyDataMap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectDate,
      const DeepCollectionEquality().hash(historyDataMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryDataViewModelImplCopyWith<_$HistoryDataViewModelImpl>
      get copyWith =>
          __$$HistoryDataViewModelImplCopyWithImpl<_$HistoryDataViewModelImpl>(
              this, _$identity);
}

abstract class _HistoryDataViewModel implements HistoryDataViewModel {
  const factory _HistoryDataViewModel(
          {required final DateTime selectDate,
          required final LinkedHashMap<DateTime, List> historyDataMap}) =
      _$HistoryDataViewModelImpl;

  @override
  DateTime get selectDate;
  @override
  LinkedHashMap<DateTime, List> get historyDataMap;
  @override
  @JsonKey(ignore: true)
  _$$HistoryDataViewModelImplCopyWith<_$HistoryDataViewModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
