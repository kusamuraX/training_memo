import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_info_repository.freezed.dart';
part 'training_info_repository.g.dart';

@freezed
class TrainingInfo with _$TrainingInfo {
  const factory TrainingInfo(
      {required int partsId,
      required int partsTrainingId,
      required int trainingId,
      required String date,
      double? weight,
      int? count,
      int? rm,
      String? memo}) = _TrainingInfo;
  factory TrainingInfo.fromJson(Map<String, Object?> json) => _$TrainingInfoFromJson(json);
}
