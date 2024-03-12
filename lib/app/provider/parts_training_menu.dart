import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/repository/parts_training_info_repository.dart';

part 'parts_training_menu.g.dart';

@riverpod
Future<List<PartsTrainingMenuInfo>> partsTrainingMenuList(PartsTrainingMenuListRef ref, AppDataBase database, int partsId) async {
  final partsTrainingInfoList = await (database.select(database.partsTrainingInfo)
        ..where(
          (tbl) => tbl.bodyPartsInfo.equals(partsId),
        ))
      .get();
  final List<PartsTrainingMenuInfo> partsTrainingMenuInfoList = [];
  for (final partsTrainingInfo in partsTrainingInfoList) {
    final maxRmTrainigInfoList = await (database.select(database.trainingDataInfo)
          ..where(
              (tbl) => tbl.bodyPartsInfo.equals(partsTrainingInfo.bodyPartsInfo) & tbl.partsTrainingInfo.equals(partsTrainingInfo.partsTrainingId))
          ..limit(1)
          ..orderBy([(t) => OrderingTerm(expression: t.rm, mode: OrderingMode.desc)]))
        .get();
    int? rm;
    if (maxRmTrainigInfoList.isNotEmpty) {
      rm = maxRmTrainigInfoList[0].rm;
    }
    partsTrainingMenuInfoList.add(PartsTrainingMenuInfo(
        partsId: partsTrainingInfo.bodyPartsInfo,
        partsTrainingId: partsTrainingInfo.partsTrainingId,
        trainingName: partsTrainingInfo.trainingName,
        maxRm: rm));
  }
  partsTrainingMenuInfoList.sort(((a, b) => a.maxRm == null ? 1 : 0));
  return partsTrainingMenuInfoList;
}
