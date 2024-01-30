import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'database.g.dart';

@riverpod
AppDataBase appDataBase(AppDataBaseRef ref) => AppDataBase();

class AppDataBase {
  static Database? _database;

  Future<Database> get database async => _database ??= await _init();

  Future<Database> _init() async {
    return await openDatabase(join(await getDatabasesPath(), 'training_memo.db'), onCreate: (db, version) async {
      await db.execute('CREATE TABLE body_parts_mst (partsId INTEGER PRIMARY KEY, partsName TEXT, lastTrainingDate TEXT)');
      await db.execute(
          'CREATE TABLE parts_training_info (partsId INTEGER NOT NULL, partsTrainingId INTEGER NOT NULL, trainingName TEXT, maxRm INTEGER, PRIMARY KEY("partsId", "partsTrainingId"))');
      await db.execute(
          'CREATE TABLE training_data_info (partsId INTEGER NOT NULL, partsTrainingId INTEGER, date TEXT NOT NULL, trainingId INTEGER, weight REAL, count INTEGER, rm INTEGER, memo TEXT, PRIMARY KEY("partsId", "partsTrainingId", "date", "trainingId"))');
    }, version: 1);
  }

  Future<void> initializedb() async {
    await database;
  }
}
