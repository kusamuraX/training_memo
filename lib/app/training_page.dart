import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_memo/app/provider/prev_training_data.dart';
import 'package:training_memo/app/provider/training_data.dart';
import 'package:training_memo/app/repository/parts_training_info_repository.dart';
import 'package:training_memo/app/widget/title_container.dart';

///
/// トレーニング情報入力
///
class TrainingPage extends ConsumerWidget {
  final PartsTrainingInfo partsTrainingInfo;
  final String tgtDate;

  TrainingPage(this.partsTrainingInfo, this.tgtDate, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      title: Text(trainingName),
      bottomOpacity: 0.0,
      elevation: 0.0,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}

class _TrainingWidget extends ConsumerWidget {
  final int partsId;
  final int partsTrainingId;
  final String date;
  final int maxRm;
  const _TrainingWidget(this.partsId, this.partsTrainingId, this.date, this.maxRm);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainingInfoList = ref.watch(trainingDataProvider);
    final prevTrainingInfoList = ref.watch(prevTrainingDataProvider);
    final rate90 = (maxRm * 0.9).toInt();
    final rate80 = (maxRm * 0.8).toInt();
    final rate60 = (maxRm * 0.6).toInt();
    return Column(
      children: [
        Visibility(
          visible: prevTrainingInfoList.isNotEmpty,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 16),
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleContaier(
                  title: '前回',
                  bgColor: Theme.of(context).primaryColor,
                  child: Table(
                    columnWidths: <int, TableColumnWidth>{
                      0: FixedColumnWidth(20),
                      1: FixedColumnWidth(60),
                      2: IntrinsicColumnWidth(),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(border: Border(bottom: const BorderSide(width: 1, color: Colors.white))),
                        children: [
                          Text("", style: TextStyle(color: Colors.white, fontSize: 12)),
                          Text("重量", style: TextStyle(color: Colors.white, fontSize: 12)),
                          Text("回数", style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                      ...List.generate(
                        prevTrainingInfoList.length,
                        (index) => TableRow(children: [
                          Text('${index + 1}', style: TextStyle(color: Colors.white, fontSize: 10)),
                          Text('${prevTrainingInfoList[index].weight} ㎏', style: TextStyle(color: Colors.white, fontSize: 10)),
                          Text('${prevTrainingInfoList[index].count} 回', style: TextStyle(color: Colors.white, fontSize: 10)),
                        ]),
                      )
                    ],
                  ),
                ),
                TitleContaier(
                  title: '参考値',
                  bgColor: Theme.of(context).primaryColor,
                  child: Table(
                    columnWidths: <int, TableColumnWidth>{
                      0: FixedColumnWidth(40),
                      1: FixedColumnWidth(50),
                      2: IntrinsicColumnWidth(),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(border: Border(bottom: const BorderSide(width: 1, color: Colors.white))),
                        children: [
                          Text("目的", style: TextStyle(color: Colors.white, fontSize: 12)),
                          Text("回数", style: TextStyle(color: Colors.white, fontSize: 12)),
                          Text("重量", style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("増強", style: TextStyle(color: Colors.white, fontSize: 10)),
                          Text("3-5", style: TextStyle(color: Colors.white, fontSize: 10)),
                          Text("$rate90 ㎏", style: TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("肥大", style: TextStyle(color: Colors.white, fontSize: 10)),
                          Text("6-12", style: TextStyle(color: Colors.white, fontSize: 10)),
                          Text("$rate80 ㎏", style: TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("持久", style: TextStyle(color: Colors.white, fontSize: 10)),
                          Text("15-25", style: TextStyle(color: Colors.white, fontSize: 10)),
                          Text("$rate60 ㎏", style: TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              ...List.generate(
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
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: IconButton(
                  onPressed: () => ref.read(trainingDataProvider.notifier).addTraining(partsId, partsTrainingId, date),
                  icon: Icon(Icons.add_circle_outline),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
