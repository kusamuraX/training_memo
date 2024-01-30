import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../repository/body_parts_mst_repository.dart';

part 'body_parts_database.g.dart';

final List<String> bodyPartsList = ['胸', '背中', '肩', '腕', '腹', '脚'];

@riverpod
BodyPartsDataBase bodyPartsDataBase(BodyPartsDataBaseRef ref) => BodyPartsDataBase();

class BodyPartsDataBase {
  static Database? _database;

  Future<Database> get database async => _database ??= await _init();

  Future<Database> _init() async {
    return await openDatabase(join(await getDatabasesPath(), 'training_memo.db'));
  }

  Future<List<BodyPartsMst>> initBodyPartsMst(Database db) async {
    List<BodyPartsMst> bodyPartsMstList = [];
    bodyPartsList.asMap().forEach((index, value) {
      bodyPartsMstList.add(BodyPartsMst(partsId: index, partsName: value, lastTrainingDate: "-"));
    });
    for (var bodyPartsMst in bodyPartsMstList) {
      db.insert('body_parts_mst', bodyPartsMst.toJson(), conflictAlgorithm: ConflictAlgorithm.abort);
    }
    return bodyPartsMstList;
  }

  Future<List<BodyPartsMst>> retrieveBodyPartsMstList(DateTime today) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("body_parts_mst");
    final Map<int, String> lastTrainingDateMaps = {};
    for (var parts in maps) {
      final int partsId = parts['partsId'] as int;
      final List<Map<String, dynamic>> trainingMaps =
          await db.query("training_data_info", where: "partsId=?", whereArgs: [partsId], orderBy: "date DESC");
      if (trainingMaps.isEmpty) {
        lastTrainingDateMaps[partsId] = '-';
      } else {
        final lastDate = DateFormat('yyyy-MM-dd').parse(trainingMaps[0]['date'] as String);
        lastTrainingDateMaps[partsId] = "${today.difference(lastDate).inDays}日前";
      }
    }

    if (maps.isEmpty) {
      // 初期の場合はデータを作成
      return initBodyPartsMst(db);
    }
    return List.generate(maps.length, (i) {
      final int partsId = maps[i]['partsId'] as int;
      return BodyPartsMst(
        partsId: partsId,
        partsName: maps[i]['partsName'] as String,
        lastTrainingDate: lastTrainingDateMaps[partsId],
      );
    });
  }
}
