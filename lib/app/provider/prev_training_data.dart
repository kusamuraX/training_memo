import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/repository/training_info_repository.dart';

part 'prev_training_data.g.dart';

@riverpod
Future<List<TrainingInfo>> prevTrainingData(PrevTrainingDataRef ref, AppDataBase database, int partsId, int trainingId, DateTime date) async {
  // 前回のトレーニングデータ
  List<TrainingInfo> trainingDataList = [];
  final prevTrainigInfo = await (database.select(database.trainingDataInfo)
        ..where((tbl) => tbl.bodyPartsInfo.equals(partsId) & tbl.partsTrainingInfo.equals(trainingId) & tbl.trainingDate.isSmallerThanValue(date))
        ..limit(1)
        ..orderBy([(t) => OrderingTerm(expression: t.trainingDate, mode: OrderingMode.desc)]))
      .get();
  if (prevTrainigInfo.isNotEmpty) {
    final prevDate = prevTrainigInfo[0].trainingDate;
    final stDate = prevDate.copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
    final edDate = prevDate.copyWith(hour: 23, minute: 59, second: 59, millisecond: 999, microsecond: 999);
    final prevTrainingList = await (database.select(database.trainingDataInfo)
          ..where((tbl) =>
              tbl.bodyPartsInfo.equals(partsId) &
              tbl.partsTrainingInfo.equals(trainingId) &
              tbl.trainingDate.isBiggerOrEqualValue(stDate) &
              tbl.trainingDate.isSmallerOrEqualValue(edDate)))
        .get();
    for (final trainingDataInfoData in prevTrainingList) {
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
  }
  return trainingDataList;
}
