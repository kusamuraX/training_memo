import 'dart:ffi';

import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

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

class PartsTrainingInfo {
  final int partsTrainingId;
  final int partsId;
  final String trainingName;
  const PartsTrainingInfo({required this.partsTrainingId, required this.partsId, required this.trainingName});
  Map<String, dynamic> toMap() {
    return {
      'parts_training_id': partsTrainingId,
      'parts_id': partsId,
      'training_name': trainingName,
    };
  }
}

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
      await db.execute('CREATE TABLE body_parts_mst (parts_id INTEGER PRIMARY KEY, parts_name TEXT)');
      await db.execute('CREATE TABLE parts_training_info (parts_training_id INTEGER PRIMARY KEY, parts_id INTEGER, training_name TEXT)');
      await db.execute(
          'CREATE TABLE training_data_info (training_id INTEGER PRIMARY KEY, parts_training_id INTEGER, date TEXT, weight REAL, count INTEGER, memo TEXT)');
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

  Future<List<BodyPartsMst>> retrieveBodyPartsMstList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("body_parts_mst");
    if (maps.isEmpty) {
      return insertBodyPartsMst(db);
    } else {
      return List.generate(maps.length, (i) {
        return BodyPartsMst(
          partsId: maps[i]['parts_id'] as int,
          partsName: maps[i]['parts_name'] as String,
        );
      });
    }
  }
}
