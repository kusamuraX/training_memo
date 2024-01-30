import 'package:freezed_annotation/freezed_annotation.dart';

part 'parts_training_info_repository.freezed.dart';
part 'parts_training_info_repository.g.dart';

@freezed
class PartsTrainingInfo with _$PartsTrainingInfo {
  const factory PartsTrainingInfo({required int partsId, required int partsTrainingId, required String trainingName, int? maxRm}) =
      _PartsTrainingInfo;
  factory PartsTrainingInfo.fromJson(Map<String, Object?> json) => _$PartsTrainingInfoFromJson(json);
}
