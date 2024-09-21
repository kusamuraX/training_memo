import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/database.dart';

part 'parts_total_weight.g.dart';

@riverpod
class PartsTotalWeightData extends _$PartsTotalWeightData {
  
  /// 各パーツの週の重量
  @override
  Stream<double> build(AppDataBase database, int partsId, DateTime date) {
    DateTime startDate = date.subtract(Duration(days: (date.weekday - 1)));
    DateTime endDate = startDate.add(Duration(days: 6));
    final query = database.select(database.trainingDataInfo).join([
      innerJoin(database.partsTrainingInfo, database.partsTrainingInfo.partsTrainingId.equalsExp(database.trainingDataInfo.partsTrainingInfo)),
      innerJoin(database.bodyPartsInfo, database.bodyPartsInfo.partsId.equalsExp(database.trainingDataInfo.bodyPartsInfo)),
    ])..where(database.trainingDataInfo.trainingDate.isBiggerOrEqualValue(startDate) &
          database.trainingDataInfo.trainingDate.isSmallerOrEqualValue(endDate) &
          database.trainingDataInfo.weight.isNotNull());
    return query
        .watch()
        .map((rows) {
      double totalWeight = 0;
      for (final row in rows) {
        totalWeight = row.readTable(database.trainingDataInfo).weight!;
      }
      return double.parse((totalWeight / 1000).toStringAsFixed(2));
    });
  }
}