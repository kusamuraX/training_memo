import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/provider/current_total_weight_data.dart';

class CurrentTrainingTotalWightWidget extends ConsumerWidget {
  final int partsId;
  final int partsTrainingId;
  final DateTime date;

  CurrentTrainingTotalWightWidget({super.key, required this.partsId, required this.partsTrainingId, required this.date});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDataBaseProvider);
    final trainingInfoListSync = ref.watch(currentTotalWeightDataProvider.call(db, partsId, partsTrainingId, date));
    return trainingInfoListSync.when(
      data: (totalWeight) => Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white, width: 1))),
        child: Center(
          child: Text('今回の総重量 : $totalWeight t'),
        ),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
