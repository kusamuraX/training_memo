import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:training_memo/app/repository/body_parts_mst_repository.dart';

part 'main_page_model.freezed.dart';

class PartsWeight {
  final double chestTotalWeight;
  final double backTotalWeight;
  final double shoulderTotalWeight;
  final double armTotalWeight;
  final double absTotalWeight;
  final double legTotalWeight;

  double totalWeight() =>
      double.parse((chestTotalWeight + backTotalWeight + shoulderTotalWeight + armTotalWeight + absTotalWeight + legTotalWeight).toStringAsFixed(2));

  double valueOfindex(int index) {
    switch (index) {
      case 0:
        return chestTotalWeight;
      case 1:
        return backTotalWeight;
      case 2:
        return shoulderTotalWeight;
      case 3:
        return armTotalWeight;
      case 4:
        return absTotalWeight;
      case 5:
        return legTotalWeight;
      default:
        return 0;
    }
  }

  PartsWeight({
    this.chestTotalWeight = 0,
    this.backTotalWeight = 0,
    this.shoulderTotalWeight = 0,
    this.armTotalWeight = 0,
    this.absTotalWeight = 0,
    this.legTotalWeight = 0,
  });
}

@freezed
class MainPageModel with _$MainPageModel {
  const factory MainPageModel({
    required DateTime today,
    required double maxScale,
    required List<BodyPartsMst> bodyPartsList,
    required List<PartsWeight> weekWeightList,
  }) = _MainPageModel;
}
