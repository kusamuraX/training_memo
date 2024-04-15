import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/database.dart';

part 'current_total_weight_data.g.dart';

@riverpod
class CurrentTotalWeightData extends _$CurrentTotalWeightData {
  @override
  Stream<double> build(AppDataBase database, int partsId, int partsTrainingId, DateTime date) {
    return getStream();
  }

  Stream<double> getStream() {
    final stDate = DateUtils.dateOnly(date);
    final edDate = DateUtils.dateOnly(date.add(Duration(days: 1)));
    return (database.select(database.trainingDataInfo)
          ..where((tbl) =>
              tbl.bodyPartsInfo.equals(partsId) &
              tbl.partsTrainingInfo.equals(partsTrainingId) &
              tbl.trainingDate.isBiggerOrEqualValue(stDate) &
              tbl.trainingDate.isSmallerThanValue(edDate)))
        .watch()
        .map((trainingDataInfoDataList) {
      double totalWeight = 0;
      for (final trainingDataInfoData in trainingDataInfoDataList) {
        if (trainingDataInfoData.weight != null && trainingDataInfoData.rep != null) {
          totalWeight += (trainingDataInfoData.weight! * trainingDataInfoData.rep!);
        }
      }
      return double.parse((totalWeight / 1000).toStringAsFixed(2));
    });
  }
}
