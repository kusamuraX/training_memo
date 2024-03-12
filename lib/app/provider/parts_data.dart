import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/database.dart';

part 'parts_data.g.dart';

@riverpod
class PartsData extends _$PartsData {
  @override
  Stream<List<BodyPartsInfoData>> build(AppDataBase database) {
    return getStream();
  }

  Stream<List<BodyPartsInfoData>> getStream() {
    return (database.select(database.bodyPartsInfo)).watch();
  }
}
