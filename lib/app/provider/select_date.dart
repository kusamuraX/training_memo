// 選択日付
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_date.g.dart';

@riverpod
class SelectDate extends _$SelectDate {
  @override
  DateTime build() => DateTime.now().add(Duration(days: 1));

  void changeDate(DateTime newDate) => state = newDate;
}
