import 'package:flutter/material.dart';
import 'package:training_memo/app/repository/parts_training_info_repository.dart';
import 'package:training_memo/app/view/training_data_page/current_training.dart';
import 'package:training_memo/app/view/training_data_page/prev_training.dart';

///
/// トレーニング情報入力
///
class TrainingPage extends StatelessWidget {
  final PartsTrainingMenuInfo partsTrainingInfo;
  final DateTime tgtDate;

  TrainingPage(this.partsTrainingInfo, this.tgtDate, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TrainingPageAppBar(partsTrainingInfo.trainingName),
      body: _TrainingWidget(partsTrainingInfo.partsId, partsTrainingInfo.partsTrainingId, tgtDate, partsTrainingInfo.maxRm ?? 0),
    );
  }
}

class TrainingPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String trainingName;
  const TrainingPageAppBar(this.trainingName, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        trainingName,
      ),
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}

class _TrainingWidget extends StatelessWidget {
  final int partsId;
  final int partsTrainingId;
  final DateTime date;
  final int maxRm;
  const _TrainingWidget(this.partsId, this.partsTrainingId, this.date, this.maxRm);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrevTrainingWidget(
          partsTrainingId: partsTrainingId,
          partsId: partsId,
          date: date,
          maxRm: maxRm,
        ),
        Expanded(
          child: CurrentTrainingWidget(
            partsTrainingId: partsTrainingId,
            partsId: partsId,
            date: date,
          ),
        ),
      ],
    );
  }
}
