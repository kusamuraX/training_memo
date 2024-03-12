import 'package:freezed_annotation/freezed_annotation.dart';

part 'parts_training_info_repository.freezed.dart';
part 'parts_training_info_repository.g.dart';

@freezed
class PartsTrainingMenuInfo with _$PartsTrainingMenuInfo {
  const factory PartsTrainingMenuInfo({required int partsId, required int partsTrainingId, required String trainingName, int? maxRm}) =
      _PartsTrainingInfo;
  factory PartsTrainingMenuInfo.fromJson(Map<String, Object?> json) => _$PartsTrainingMenuInfoFromJson(json);
}
