import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'body_parts_mst_repository.freezed.dart';
part 'body_parts_mst_repository.g.dart';

@freezed
class BodyPartsMst with _$BodyPartsMst {
  const factory BodyPartsMst({required int partsId, required String partsName}) = _BodyPartsMst;
  factory BodyPartsMst.fromJson(Map<String, Object?> json) => _$BodyPartsMstFromJson(json);
}

class BodyPartsMstRepository {
  late Database db;

  BodyPartsMstRepository({required Database db});

  Future<List<BodyPartsMst>> getBodyPartsMst() async {
    List<Map<String, dynamic>> maps = await db.query('body_parts_mst');
    if (maps.isEmpty) {
      return _init(db);
    } else {
      return List.generate(maps.length, (i) {
        return BodyPartsMst(
          partsId: maps[i]['parts_id'] as int,
          partsName: maps[i]['parts_name'] as String,
        );
      });
    }
  }

  Future<List<BodyPartsMst>> _init(Database db) async {
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
}
