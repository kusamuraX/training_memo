import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_memo/app/provider/training_data.dart';
import 'package:training_memo/app/repository/parts_training_info_repository.dart';

class TrainingPage extends ConsumerWidget {
  final PartsTrainingInfo partsTrainingInfo;
  final String tgtDate;

  TrainingPage(this.partsTrainingInfo, this.tgtDate, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: TrainingPageAppBar(partsTrainingInfo.trainingName),
      body: _TrainingWidget(partsTrainingInfo.partsId, partsTrainingInfo.partsTrainingId, tgtDate),
    );
  }
}

class TrainingPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String trainingName;
  const TrainingPageAppBar(this.trainingName, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(trainingName),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}

class _TrainingWidget extends ConsumerWidget {
  final int partsId;
  final int partsTrainingId;
  final String date;
  const _TrainingWidget(this.partsId, this.partsTrainingId, this.date);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainingInfoList = ref.watch(trainingDataProvider);
    final dataCardList = List.generate(
      trainingInfoList.length,
      (index) => Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: Focus(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: '重量',
                    suffix: Text('㎏'),
                  ),
                  textAlign: TextAlign.right,
                  initialValue: trainingInfoList[index].weight?.toString() ?? "",
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d*)?'))],
                  onChanged: (value) => ref.read(trainingDataProvider.notifier).updateWeight(trainingInfoList[index], value),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "回数",
                    suffix: Text("回"),
                  ),
                  textAlign: TextAlign.right,
                  initialValue: trainingInfoList[index].count?.toString() ?? "",
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => ref.read(trainingDataProvider.notifier).updateCount(trainingInfoList[index], value),
                ),
              ),
              SizedBox(width: 20),
              Text(
                "${trainingInfoList[index].rm?.toString() ?? ""}RM",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text("削除しますか？"),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('キャンセル'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('削除'),
                            onPressed: () {
                              ref.read(trainingDataProvider.notifier).delete(trainingInfoList[index]);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.delete),
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                color: Colors.blueGrey,
              ),
            ],
          ),
          onFocusChange: (hasFocus) {
            if (!hasFocus) {
              ref.read(trainingDataProvider.notifier).updateRm(trainingInfoList[index]);
            }
          },
        ),
      ),
    );
    dataCardList.add(Container(
      padding: EdgeInsets.all(12),
      child: IconButton(
        onPressed: () => ref.read(trainingDataProvider.notifier).addTraining(partsId, partsTrainingId, date),
        icon: Icon(Icons.add_circle_outline),
      ),
    ));
    return ListView(
      children: dataCardList,
    );
  }
}
