import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/database.dart';

part 'parts_training_data.g.dart';

@riverpod
class PartsTrainingData extends _$PartsTrainingData {
  @override
  Stream<List<PartsTrainingInfoData>> build(AppDataBase database, int partsId) {
    return getStream();
  }

  Stream<List<PartsTrainingInfoData>> getStream() =>
      (database.select(database.partsTrainingInfo)..where((tbl) => tbl.bodyPartsInfo.equals(partsId))).watch();

  void addMenu(menuName) {
    // 追加
    final newPartsTrainingInfo = PartsTrainingInfoCompanion(bodyPartsInfo: Value(partsId), trainingName: Value(menuName));
    database.into(database.partsTrainingInfo).insert(newPartsTrainingInfo);
  }

  Future<bool> deleteMenu(trainingId) async {
    // 削除
    final trainingData = await ((database.select(database.trainingDataInfo))
          ..where((tbl) => tbl.partsTrainingInfo.equals(trainingId))
          ..limit(1))
        .get();
    if (trainingData.isEmpty) {
      // データがないものは削除できる
      (database.delete(database.partsTrainingInfo)..where((tbl) => tbl.partsTrainingId.equals(trainingId))).go();
      return true;
    }
    return false;
  }
}
