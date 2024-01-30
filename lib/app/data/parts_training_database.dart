import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:training_memo/app/repository/parts_training_info_repository.dart';

part 'parts_training_database.g.dart';

final Map<int, List<String>> trainingMap = {
  0: ['ベンチプレス', 'チェストプレス', 'ダンベルプレス', 'ダンベルフライ', 'ペクトフライ', 'インクラインダンベルプレス', 'インクラインダンベルフライ', 'インクラインベンチプレス', 'インクラインプレス'],
  1: ['ラットプルダウン', 'デッドリフト', 'チンニング', 'ワンハンドロウ', 'ベントオーバーロウ', 'プーリーロー', 'バックエクステンション', 'ワイドプルダウン'],
  2: ['サイドレイズ', 'ショルダープレス', 'アップライトロウ', 'フロントレイズ', 'リアレイズ', 'アーノルドプレス', 'サイドライイングリアレイズ'],
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
    'トライセップスプレス',
    'ディップス'
  ],
  4: ['アブローラー', 'レッグレイズ', 'シットアップ', 'アブドミナルクランチ', 'トーソローテーション', 'ケーブルクランチ'],
  5: ['スクワット', 'レッグプレス', 'レッグエクステンション', 'レッグカール', 'カーフレイズ', 'ヒップアブダクション']
};

@riverpod
PartsTrainingDataBase partsTrainingDataBase(PartsTrainingDataBaseRef ref) => PartsTrainingDataBase();

class PartsTrainingDataBase {
  static Database? _database;

  Future<Database> get database async => _database ??= await _init();

  Future<Database> _init() async {
    return await openDatabase(join(await getDatabasesPath(), 'training_memo.db'));
  }

  Future<List<PartsTrainingInfo>> initPartsTrainingInfo(Database db, int tgtPartsId) async {
    List<PartsTrainingInfo> partsTrainingInfoList = [];
    trainingMap[tgtPartsId]?.asMap().forEach((index, value) {
      partsTrainingInfoList.add(PartsTrainingInfo(partsId: tgtPartsId, partsTrainingId: index, trainingName: value));
    });
    for (var partsTrainingInfo in partsTrainingInfoList) {
      db.insert('parts_training_info', partsTrainingInfo.toJson(), conflictAlgorithm: ConflictAlgorithm.abort);
    }
    return partsTrainingInfoList;
  }

  Future<List<PartsTrainingInfo>> retrievePartTrainingList(int tgtPartsId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("parts_training_info", where: "partsId=?", whereArgs: [tgtPartsId]);
    final Map<int, int> maxRmMaps = {};
    for (var partsTraining in maps) {
      final int partsId = partsTraining['partsId'] as int;
      final int partsTrainingId = partsTraining['partsTrainingId'] as int;
      final List<Map<String, dynamic>> trainingMaps =
          await db.query("training_data_info", where: "partsId=? AND partsTrainingId=?", whereArgs: [partsId, partsTrainingId], orderBy: "rm DESC");
      if (trainingMaps.isNotEmpty) {
        final rm = trainingMaps[0]['rm'] as int?;
        if (rm != null) {
          maxRmMaps[partsTrainingId] = rm;
        }
      }
    }
    if (maps.isEmpty) {
      return initPartsTrainingInfo(db, tgtPartsId);
    } else {
      return List.generate(maps.length, (i) {
        final int partsTrainingId = maps[i]['partsTrainingId'] as int;
        return PartsTrainingInfo(
          partsId: maps[i]['partsId'] as int,
          partsTrainingId: partsTrainingId,
          trainingName: maps[i]['trainingName'] as String,
          maxRm: maxRmMaps[partsTrainingId],
        );
      });
    }
  }
}
