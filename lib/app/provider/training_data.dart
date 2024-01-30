import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/training_data_database.dart';
import 'package:training_memo/app/repository/training_info_repository.dart';

part 'training_data.g.dart';

@riverpod
class TrainingData extends _$TrainingData {
  @override
  List<TrainingInfo> build() => [];

  Future<void> getAll(int tgtPartsId, int tgtTrainingId, String tgtDate) async {
    state = await ref.read(trainingDataBaseProvider).retrieveTrainingList(tgtPartsId, tgtTrainingId, tgtDate);
  }

  Future<void> addTraining(int tgtPartsId, int tgtTrainingId, String tgtDate) async {
    state = [...state, await ref.read(trainingDataBaseProvider).insertNewTrainingInfo(tgtPartsId, tgtTrainingId, tgtDate)];
  }

  void updateWeight(TrainingInfo trainingInfo, String weightValue) {
    double newWeightValue = 0.0;
    if (weightValue.isNotEmpty) {
      newWeightValue = double.parse(weightValue);
    }
    ref.read(trainingDataBaseProvider).updateWeight(trainingInfo, newWeightValue);
  }

  void updateCount(TrainingInfo trainingInfo, String countValue) async {
    int newCountValue = 0;
    if (countValue.isNotEmpty) {
      newCountValue = int.parse(countValue);
    }
    ref.read(trainingDataBaseProvider).updateCount(trainingInfo, newCountValue);
  }

  void updateRm(TrainingInfo trainingInfo) async {
    await ref.read(trainingDataBaseProvider).calcRm(trainingInfo);
    getAll(trainingInfo.partsId, trainingInfo.partsTrainingId, trainingInfo.date);
  }

  void delete(TrainingInfo trainingInfo) async {
    await ref.read(trainingDataBaseProvider).delete(trainingInfo);
    getAll(trainingInfo.partsId, trainingInfo.partsTrainingId, trainingInfo.date);
  }
}
