import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/repository/training_info_repository.dart';

part 'training_data.g.dart';

@riverpod
class TrainingData extends _$TrainingData {
  @override
  Stream<List<TrainingInfo>> build(AppDataBase database, int partsId, int partsTrainingId, DateTime date) {
    return getStream();
  }

  Stream<List<TrainingInfo>> getStream() {
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
      List<TrainingInfo> trainingDataList = [];
      for (final trainingDataInfoData in trainingDataInfoDataList) {
        trainingDataList.add(TrainingInfo(
            partsId: trainingDataInfoData.bodyPartsInfo,
            partsTrainingId: trainingDataInfoData.partsTrainingInfo,
            trainingId: trainingDataInfoData.trainingId,
            count: trainingDataInfoData.rep,
            date: trainingDataInfoData.trainingDate,
            memo: trainingDataInfoData.memo,
            rm: trainingDataInfoData.rm,
            weight: trainingDataInfoData.weight));
      }
      return trainingDataList;
    });
  }

  void addTraining() {
    // 追加
    final newTrainingDataInfo = TrainingDataInfoCompanion(
      bodyPartsInfo: Value(partsId),
      partsTrainingInfo: Value(partsTrainingId),
      trainingDate: Value(date),
    );
    database.into(database.trainingDataInfo).insert(newTrainingDataInfo);
  }

  void updateWeight(TrainingInfo trainingInfo, String weightValue) {
    // 重量更新
    double? newWeightValue;
    if (weightValue.isNotEmpty) {
      newWeightValue = double.parse(weightValue);
    }
    (database.update(database.trainingDataInfo)..where((tbl) => tbl.trainingId.equals(trainingInfo.trainingId)))
        .write(TrainingDataInfoCompanion(weight: Value(newWeightValue)));
  }

  void updateCount(TrainingInfo trainingInfo, String countValue) async {
    // 回数更新
    int? newCountValue;
    if (countValue.isNotEmpty) {
      newCountValue = int.parse(countValue);
    }
    (database.update(database.trainingDataInfo)..where((tbl) => tbl.trainingId.equals(trainingInfo.trainingId)))
        .write(TrainingDataInfoCompanion(rep: Value(newCountValue)));
  }

  void updateRm(TrainingInfo trainingInfo) async {
    // rm更新
    int? rm;
    if (trainingInfo.count != null && trainingInfo.weight != null) {
      final count = trainingInfo.count ?? 0;
      final weight = trainingInfo.weight ?? 0;
      rm = count == 1 ? weight.toInt() : (weight * (1 + (count / 40))).toInt();
    }
    (database.update(database.trainingDataInfo)..where((tbl) => tbl.trainingId.equals(trainingInfo.trainingId)))
        .write(TrainingDataInfoCompanion(rm: Value(rm)));
  }

  void delete(TrainingInfo trainingInfo) async {
    // 削除
    (database.delete(database.trainingDataInfo)..where((tbl) => tbl.trainingId.equals(trainingInfo.trainingId))).go();
  }
}
