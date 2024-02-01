import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:training_memo/app/repository/training_info_repository.dart';

part 'training_data_database.g.dart';

@riverpod
TrainingDataBase trainingDataBase(TrainingDataBaseRef ref) => TrainingDataBase();

class TrainingDataBase {
  static Database? _database;
  List<TrainingInfo> trainingInfoList = [];

  Future<Database> get database async => _database ??= await _init();

  Future<Database> _init() async {
    return await openDatabase(join(await getDatabasesPath(), 'training_memo.db'));
  }

  Future<List<TrainingInfo>> initTrainingInfo(Database db, int tgtPartsId, int tgtPartsTrainingId, String tgtDate) async {
    List<TrainingInfo> trainingInfoList = [];
    List.generate(3, (index) {
      TrainingInfo newTrainingInfo = TrainingInfo(partsId: tgtPartsId, partsTrainingId: tgtPartsTrainingId, date: tgtDate, trainingId: index);
      db.insert('training_data_info', newTrainingInfo.toJson(), conflictAlgorithm: ConflictAlgorithm.abort);
      trainingInfoList.add(newTrainingInfo);
    });
    return trainingInfoList;
  }

  Future<TrainingInfo> insertNewTrainingInfo(int tgtPartsId, int tgtTrainingId, String tgtDate) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query("training_data_info", where: "partsId=? AND partsTrainingId=? AND date=?", whereArgs: [tgtPartsId, tgtTrainingId, tgtDate]);
    int existsCount = maps.length;
    // 新規を追加
    TrainingInfo newTrainingInfo = TrainingInfo(partsId: tgtPartsId, partsTrainingId: tgtTrainingId, date: tgtDate, trainingId: existsCount++);
    db.insert('training_data_info', newTrainingInfo.toJson(), conflictAlgorithm: ConflictAlgorithm.abort);
    return newTrainingInfo;
  }

  void updateWeight(TrainingInfo trainingInfo, double weightValue) async {
    final db = await database;
    final updateValues = {"weight": weightValue};
    await db.update("training_data_info", updateValues,
        where: "partsId=? AND partsTrainingId=? AND date=? AND trainingId=?",
        whereArgs: [trainingInfo.partsId, trainingInfo.partsTrainingId, trainingInfo.date, trainingInfo.trainingId]);
  }

  void updateCount(TrainingInfo trainingInfo, int countValue) async {
    final db = await database;
    final updateValues = {"count": countValue};
    await db.update("training_data_info", updateValues,
        where: "partsId=? AND partsTrainingId=? AND date=? AND trainingId=?",
        whereArgs: [trainingInfo.partsId, trainingInfo.partsTrainingId, trainingInfo.date, trainingInfo.trainingId]);
  }

  Future<void> calcRm(TrainingInfo trainingInfo) async {
    final db = await database;
    // weightとcountが入力されていればrmを計算する(Epley)
    final List<Map<String, dynamic>> maps = await db.query("training_data_info",
        where: "partsId=? AND partsTrainingId=? AND date=?", whereArgs: [trainingInfo.partsId, trainingInfo.partsTrainingId, trainingInfo.date]);
    if (maps.isNotEmpty) {
      for (var training in maps) {
        final trainingId = training['trainingId'] as int;
        final weight = training['weight'] as double?;
        final count = training['count'] as int?;
        if (weight != null && count != null) {
          final rmValue = count == 1 ? weight.toInt() : (weight * (1 + (count / 40))).toInt();
          final updateValues = {"rm": rmValue};
          await db.update("training_data_info", updateValues,
              where: "partsId=? AND partsTrainingId=? AND date=? AND trainingId=?",
              whereArgs: [trainingInfo.partsId, trainingInfo.partsTrainingId, trainingInfo.date, trainingId]);
        }
      }
    }
  }

  Future<void> delete(TrainingInfo trainingInfo) async {
    final db = await database;
    await db.delete("training_data_info",
        where: "partsId=? AND partsTrainingId=? AND date=? AND trainingId=?",
        whereArgs: [trainingInfo.partsId, trainingInfo.partsTrainingId, trainingInfo.date, trainingInfo.trainingId]);
  }

  Future<List<TrainingInfo>> retrieveTrainingList(int tgtPartsId, int tgtPartsTrainingId, String tgtDate) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db
        .query("training_data_info", where: "partsId=? AND partsTrainingId=? AND date=?", whereArgs: [tgtPartsId, tgtPartsTrainingId, tgtDate]);
    if (maps.isEmpty) {
      return initTrainingInfo(db, tgtPartsId, tgtPartsTrainingId, tgtDate);
    }
    return List.generate(maps.length, (i) {
      return TrainingInfo(
          partsId: maps[i]['partsId'] as int,
          partsTrainingId: maps[i]['partsTrainingId'] as int,
          date: maps[i]['date'] as String,
          trainingId: maps[i]['trainingId'] as int,
          weight: maps[i]['weight'] as double?,
          count: maps[i]['count'] as int?,
          rm: maps[i]['rm'] as int?,
          memo: maps[i]['memo'] as String?);
    });
  }

  /// 前回のトレーニング取得
  Future<List<TrainingInfo>> retrievePrevTrainingList(int tgtPartsId, int tgtPartsTrainingId, String tgtDate) async {
    final db = await database;
    final List<Map<String, dynamic>> prevDataMaps = await db.query("training_data_info",
        where: "partsId=? AND partsTrainingId=? AND date<? AND rm IS NOT NULL",
        whereArgs: [tgtPartsId, tgtPartsTrainingId, tgtDate],
        limit: 1,
        orderBy: "date DESC");
    if (prevDataMaps.isEmpty) {
      return [];
    }
    final List<Map<String, dynamic>> maps = await db.query("training_data_info",
        where: "partsId=? AND partsTrainingId=? AND date=? AND rm IS NOT NULL", whereArgs: [tgtPartsId, tgtPartsTrainingId, prevDataMaps[0]['date']]);
    return List.generate(maps.length, (i) {
      return TrainingInfo(
          partsId: maps[i]['partsId'] as int,
          partsTrainingId: maps[i]['partsTrainingId'] as int,
          date: maps[i]['date'] as String,
          trainingId: maps[i]['trainingId'] as int,
          weight: maps[i]['weight'] as double?,
          count: maps[i]['count'] as int?,
          rm: maps[i]['rm'] as int?,
          memo: maps[i]['memo'] as String?);
    });
  }
}
