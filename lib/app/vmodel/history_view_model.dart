import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_view_model.freezed.dart';

@freezed
class HistoryDataViewModel with _$HistoryDataViewModel {
  const factory HistoryDataViewModel({required DateTime selectDate, required LinkedHashMap<DateTime, List> historyDataMap}) = _HistoryDataViewModel;
}
