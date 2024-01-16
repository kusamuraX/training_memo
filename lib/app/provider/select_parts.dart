// tab位置
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/repository/body_parts_mst_repository.dart';

part 'select_parts.g.dart';

@riverpod
class SelectParts extends _$SelectParts {
  @override
  BodyPartsMst build() => BodyPartsMst(partsId: 0, partsName: '');

  void setParts(selectParts) => state = selectParts;
}
