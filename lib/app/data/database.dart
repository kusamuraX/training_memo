import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

@riverpod
AppDataBase appDataBase(AppDataBaseRef ref) => AppDataBase();

class BodyPartsInfo extends Table {
  IntColumn get partsId => integer().autoIncrement()();
  TextColumn get partsName => text()();
}

class PartsTrainingInfo extends Table {
  IntColumn get bodyPartsInfo => integer().references(BodyPartsInfo, #partsId)();
  IntColumn get partsTrainingId => integer().autoIncrement()();
  TextColumn get trainingName => text()();
}

class TrainingDataInfo extends Table {
  IntColumn get bodyPartsInfo => integer().references(BodyPartsInfo, #partsId)();
  IntColumn get partsTrainingInfo => integer().references(PartsTrainingInfo, #partsTrainingId)();
  IntColumn get trainingId => integer().autoIncrement()();
  DateTimeColumn get trainingDate => dateTime().withDefault(Constant(DateTime.now()))();
  RealColumn get weight => real().nullable()();
  IntColumn get rep => integer().nullable()();
  IntColumn get rm => integer().nullable()();
  TextColumn get memo => text().nullable()();
}

class TrainingDataWithAll {
  final BodyPartsInfoData bodyPartsInfo;
  final PartsTrainingInfoData partsTrainingInfo;
  final TrainingDataInfoData trainingDataInfo;

  TrainingDataWithAll(this.bodyPartsInfo, this.partsTrainingInfo, this.trainingDataInfo);
}

@DriftDatabase(tables: [BodyPartsInfo, PartsTrainingInfo, TrainingDataInfo])
class AppDataBase extends _$AppDataBase {
  AppDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1; // DB変更の度にインクリメント

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          // 初期データ作成
          await m.createAll();
          for (var i = 0; i < bodyPartsList.length; i++) {
            // 部位
            await into(bodyPartsInfo).insert(BodyPartsInfoCompanion(partsId: Value(i), partsName: Value(bodyPartsList[i])));
            // 種目
            var trainingList = trainingMap[i];
            for (String trainingName in trainingList!) {
              await into(partsTrainingInfo).insert(PartsTrainingInfoCompanion(bodyPartsInfo: Value(i), trainingName: Value(trainingName)));
            }
          }
        },
        onUpgrade: (m, from, to) async {},
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

const List<String> bodyPartsList = ['胸', '背中', '肩', '腕', '腹', '脚'];
const Map<int, List<String>> trainingMap = {
  0: ['ベンチプレス', 'チェストプレス', 'ダンベルプレス', 'ダンベルフライ', 'ペクトフライ', 'インクラインダンベルプレス', 'インクラインダンベルフライ', 'インクラインベンチプレス', 'インクラインプレス', 'デクラインプレス', 'ディップス'],
  1: ['ラットプルダウン', 'デッドリフト', 'チンニング', 'ワンハンドロウ', 'ベントオーバーロウ', 'プーリーロー', 'バックエクステンション', 'ワイドプルダウン', 'バーロウ'],
  2: ['サイドレイズ', 'ショルダープレス', 'アップライトロウ', 'フロントレイズ', 'リアレイズ', 'アーノルドプレス', 'サイドライイングリアレイズ', 'リアデルトイド', 'ラテラルレイズ'],
  3: [
    'ダンベルアームカール',
    'フレンチプレス',
    'ハンマーカール',
    'インクラインダンベルアームカール',
    'インクラインハンマーカール',
    'バーベルカール',
    'ケーブルカール',
    'スカルクラッシャー',
    'キックバック',
    'ケーブルダウン',
    'ケーブルオーバーヘッドエクステンション',
    'トライセプスプレス',
  ],
  4: ['アブローラー', 'レッグレイズ', 'シットアップ', 'アブドミナルクランチ', 'トーソローテーション', 'ケーブルクランチ'],
  5: ['スクワット', 'レッグプレス', 'レッグエクステンション', 'レッグカール', 'カーフレイズ', 'ヒップアブダクション', 'ヒップアダクション', 'ブラジリアンスクワット']
};

// class AppDataBase {
//   static Database? _database;

//   Future<Database> get database async => _database ??= await _init();

//   Future<Database> _init() async {
//     return await openDatabase(join(await getDatabasesPath(), 'training_memo.db'), onCreate: (db, version) async {
//       await db.execute('CREATE TABLE body_parts_mst (partsId INTEGER PRIMARY KEY, partsName TEXT, lastTrainingDate TEXT)');
//       await db.execute(
//           'CREATE TABLE parts_training_info (partsId INTEGER NOT NULL, partsTrainingId INTEGER NOT NULL, trainingName TEXT, maxRm INTEGER, PRIMARY KEY("partsId", "partsTrainingId"))');
//       await db.execute(
//           'CREATE TABLE training_data_info (partsId INTEGER NOT NULL, partsTrainingId INTEGER, date TEXT NOT NULL, trainingId INTEGER, weight REAL, count INTEGER, rm INTEGER, memo TEXT, PRIMARY KEY("partsId", "partsTrainingId", "date", "trainingId"))');
//     }, version: 1);
//   }

//   Future<void> initializedb() async {
//     await database;
//   }
// }
