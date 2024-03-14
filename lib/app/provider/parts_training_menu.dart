import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/repository/parts_training_info_repository.dart';

part 'parts_training_menu.g.dart';

@riverpod
Stream<List<PartsTrainingMenuInfo>> partsTrainingMenuList(PartsTrainingMenuListRef ref, AppDataBase database, int partsId) {
  final maxRm = database.trainingDataInfo.rm.max();
  final query = database.select(database.partsTrainingInfo).join([
    leftOuterJoin(database.trainingDataInfo, database.trainingDataInfo.partsTrainingInfo.equalsExp(database.partsTrainingInfo.partsTrainingId),
        useColumns: false)
  ]);
  query.where(database.partsTrainingInfo.bodyPartsInfo.equals(partsId));
  query.addColumns([maxRm]);
  query.groupBy([database.partsTrainingInfo.partsTrainingId]);
  query.orderBy([OrderingTerm.desc(database.trainingDataInfo.rm)]);
  return query.watch().map((rows) {
    return rows.map((row) {
      final tbl = row.readTable(database.partsTrainingInfo);
      final rm = row.read(maxRm);
      return PartsTrainingMenuInfo(partsId: tbl.bodyPartsInfo, partsTrainingId: tbl.partsTrainingId, trainingName: tbl.trainingName, maxRm: rm);
    }).toList();
  });
}
