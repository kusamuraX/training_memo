import 'package:freezed_annotation/freezed_annotation.dart';

part 'body_parts_mst_repository.freezed.dart';
part 'body_parts_mst_repository.g.dart';

@freezed
class BodyPartsMst with _$BodyPartsMst {
  const factory BodyPartsMst({required int partsId, required String partsName, String? lastTrainingDate}) = _BodyPartsMst;
  factory BodyPartsMst.fromJson(Map<String, Object?> json) => _$BodyPartsMstFromJson(json);
}
