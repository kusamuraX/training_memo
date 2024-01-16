import 'dart:ffi';

import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:training_memo/app/repository/parts_training_info_repository.dart';

import '../repository/body_parts_mst_repository.dart';

part 'database.g.dart';

// class BodyPartsMst {
//   final int partsId;
//   final String partsName;
//   const BodyPartsMst({required this.partsId, required this.partsName});
//   Map<String, dynamic> toMap() {
//     return {
//       'parts_id': partsId,
//       'parts_name': partsName,
//     };
//   }
// }

// class PartsTrainingInfo {
//   final int partsTrainingId;
//   final int partsId;
//   final String trainingName;
//   const PartsTrainingInfo({required this.partsTrainingId, required this.partsId, required this.trainingName});
//   Map<String, dynamic> toMap() {
//     return {
//       'parts_training_id': partsTrainingId,
//       'parts_id': partsId,
//       'training_name': trainingName,
//     };
//   }
// }

class TrainingDataInfo {
  final int trainingId;
  final int partsTrainingId;
  final String date;
  final Float weight;
  final int count;
  final String memo;
  const TrainingDataInfo(
      {required this.trainingId, required this.partsTrainingId, required this.date, required this.weight, required this.count, this.memo = ''});
  Map<String, dynamic> toMap() {
    return {
      'training_id': trainingId,
      'parts_training_id': partsTrainingId,
      'date': date,
      'weight': weight,
      'count': count,
      'memo': memo,
    };
  }
}

@riverpod
AppDataBase appDataBase(AppDataBaseRef ref) => AppDataBase();

class AppDataBase {
  static Database? _database;

  Future<Database> get database async => _database ??= await _init();

  Future<Database> _init() async {
    return await openDatabase(join(await getDatabasesPath(), 'training_memo.db'), onCreate: (db, version) async {
      await db.execute('CREATE TABLE body_parts_mst (partsId INTEGER PRIMARY KEY, partsName TEXT)');
      await db.execute(
          'CREATE TABLE parts_training_info (partsId INTEGER NOT NULL, partsTrainingId INTEGER NOT NULL, trainingName TEXT, PRIMARY KEY("partsId", "partsTrainingId"))');
      await db.execute(
          'CREATE TABLE training_data_info (partsTrainingId INTEGER, date TEXT, weight REAL, count INTEGER, memo TEXT, PRIMARY KEY("partsTrainingId", "date"))');
    }, version: 1);
  }

  Future<List<BodyPartsMst>> insertBodyPartsMst(Database db) async {
    List<String> bodyPartsList = ['胸', '背中', '肩', '腕', '腹', '脚'];
    List<BodyPartsMst> bodyPartsMstList = [];
    bodyPartsList.asMap().forEach((index, value) {
      bodyPartsMstList.add(BodyPartsMst(partsId: index, partsName: value));
    });
    for (var bodyPartsMst in bodyPartsMstList) {
      db.insert('body_parts_mst', bodyPartsMst.toJson(), conflictAlgorithm: ConflictAlgorithm.abort);
    }
    return bodyPartsMstList;
  }

  Future<List<PartsTrainingInfo>> insertPartsTrainingInfo(Database db, int tgtPartsId) async {
    Map<int, List<String>> trainingMap = {0: []};
    List<PartsTrainingInfo> partsTrainingInfoList = [];
    // bodyPartsList.asMap().forEach((index, value) {
    //   partsTrainingInfoList.add(PartsTrainingInfo(partsId: tgtPartsId, partsTrainingId: index, trainingName: value));
    // });
    // for (var partsTrainingInfo in partsTrainingInfoList) {
    //   db.insert('parts_training_info', partsTrainingInfo.toJson(), conflictAlgorithm: ConflictAlgorithm.abort);
    // }
    return partsTrainingInfoList;
  }

  Future<List<BodyPartsMst>> retrieveBodyPartsMstList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("body_parts_mst");
    if (maps.isEmpty) {
      return insertBodyPartsMst(db);
    } else {
      return List.generate(maps.length, (i) {
        return BodyPartsMst(
          partsId: maps[i]['partsId'] as int,
          partsName: maps[i]['partsName'] as String,
        );
      });
    }
  }

  Future<List<PartsTrainingInfo>> retrievePartTrainingList(int tgtPartsId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("parts_training_info", where: "partsId=?", whereArgs: [tgtPartsId]);
    if (maps.isEmpty) {
      return insertPartsTrainingInfo(db, tgtPartsId);
    } else {
      return List.generate(maps.length, (i) {
        return PartsTrainingInfo(
          partsId: maps[i]['partsId'] as int,
          partsTrainingId: maps[i]['partsTrainingId'] as int,
          trainingName: maps[i]['trainingName'] as String,
        );
      });
    }
  }
}
