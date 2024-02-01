import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/training_data_database.dart';
import 'package:training_memo/app/repository/training_info_repository.dart';

part 'prev_training_data.g.dart';

@riverpod
class PrevTrainingData extends _$PrevTrainingData {
  @override
  List<TrainingInfo> build() => [];

  Future<void> getAll(int tgtPartsId, int tgtTrainingId, String tgtDate) async {
    state = await ref.read(trainingDataBaseProvider).retrievePrevTrainingList(tgtPartsId, tgtTrainingId, tgtDate);
  }
}
