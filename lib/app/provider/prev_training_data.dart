import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/vmodel/prev_training_data_model.dart';

part 'prev_training_data.g.dart';

@riverpod
Future<List<TrainingDateData>> prevTrainingData(PrevTrainingDataRef ref, AppDataBase database, int partsId, int trainingId, DateTime date) async {
  // 前回のトレーニングデータ
  List<TrainingDateData> trainingDateDataList = [];
  var startDate = date; // 起点の日付
  for (var i = 0; i < 3; i++) {
    final lastTrainigInfo = await (database.select(database.trainingDataInfo)
          ..where((tbl) =>
              tbl.bodyPartsInfo.equals(partsId) &
              tbl.partsTrainingInfo.equals(trainingId) &
              tbl.trainingDate.isSmallerThanValue(startDate) &
              tbl.rm.isNotNull())
          ..limit(1)
          ..orderBy([(t) => OrderingTerm(expression: t.trainingDate, mode: OrderingMode.desc)]))
        .get();
    if (lastTrainigInfo.isNotEmpty) {
      final prevDate = lastTrainigInfo[0].trainingDate;
      final stDate = DateUtils.dateOnly(prevDate);
      final edDate = DateUtils.dateOnly(stDate.add(Duration(days: 1)));
      final prevTrainingList = await (database.select(database.trainingDataInfo)
            ..where((tbl) =>
                tbl.bodyPartsInfo.equals(partsId) &
                tbl.partsTrainingInfo.equals(trainingId) &
                tbl.trainingDate.isBiggerOrEqualValue(stDate) &
                tbl.trainingDate.isSmallerOrEqualValue(edDate)))
          .get();
      double totalWeight = 0;
      List<TrainingMinData> trainingList = [];
      for (final trainingDataInfoData in prevTrainingList) {
        if (trainingDataInfoData.weight != null && trainingDataInfoData.rep != null) {
          totalWeight += (trainingDataInfoData.weight! * trainingDataInfoData.rep!);
          trainingList.add(TrainingMinData(weight: trainingDataInfoData.weight!, rep: trainingDataInfoData.rep!));
        }
      }
      trainingDateDataList.add(
          TrainingDateData(trainingDate: prevDate, totalWeight: double.parse((totalWeight / 1000).toStringAsFixed(2)), trainingList: trainingList));
      startDate = DateUtils.dateOnly(prevDate);
    } else {
      break;
    }
  }
  return trainingDateDataList;
}
