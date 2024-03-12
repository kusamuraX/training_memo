// 選択日付
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_month.g.dart';

@riverpod
class CurrentMonth extends _$CurrentMonth {
  @override
  DateTime build() => DateUtils.dateOnly(DateTime.utc(DateTime.now().year, DateTime.now().month, 1));

  void changeMonth(DateTime newDate) => state = DateUtils.dateOnly(DateTime.utc(newDate.year, newDate.month, 1));
}
