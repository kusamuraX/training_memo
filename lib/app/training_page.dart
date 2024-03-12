import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/provider/prev_training_data.dart';
import 'package:training_memo/app/provider/training_data.dart';
import 'package:training_memo/app/repository/parts_training_info_repository.dart';
import 'package:training_memo/app/widget/title_container.dart';

///
/// トレーニング情報入力
///
class TrainingPage extends ConsumerWidget {
  final PartsTrainingMenuInfo partsTrainingInfo;
  final DateTime tgtDate;

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

class _TrainingWidget extends ConsumerWidget {
  final int partsId;
  final int partsTrainingId;
  final DateTime date;
  final int maxRm;
  const _TrainingWidget(this.partsId, this.partsTrainingId, this.date, this.maxRm);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDataBaseProvider);
    final trainingInfoList = ref.watch(trainingDataProvider.call(db, partsId, partsTrainingId, date));
    final prevTrainingInfoListSync = ref.watch(prevTrainingDataProvider.call(db, partsId, partsTrainingId, date));
    final rate87 = (maxRm * 0.87).toInt();
    final rate70 = (maxRm * 0.7).toInt();
    final rate60 = (maxRm * 0.6).toInt();
    return Column(
      children: [
        prevTrainingInfoListSync.when(
          data: (prevTrainingInfoList) => Visibility(
            visible: prevTrainingInfoList.isNotEmpty,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 16),
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
                        1: FixedColumnWidth(40),
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
                            Text("5", style: TextStyle(color: Colors.white, fontSize: 10)),
                            Text("$rate87 ㎏", style: TextStyle(color: Colors.white, fontSize: 10)),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text("肥大", style: TextStyle(color: Colors.white, fontSize: 10)),
                            Text("10", style: TextStyle(color: Colors.white, fontSize: 10)),
                            Text("$rate70 ㎏", style: TextStyle(color: Colors.white, fontSize: 10)),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text("持久", style: TextStyle(color: Colors.white, fontSize: 10)),
                            Text("15", style: TextStyle(color: Colors.white, fontSize: 10)),
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
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
        Expanded(
          child: ListView(
            children: [
              ...trainingInfoList.when(
                data: (dataList) {
                  return List.generate(
                    dataList.length,
                    (index) => Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
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
                                initialValue: dataList[index].weight?.toString() ?? "",
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d*)?'))],
                                onChanged: (value) => ref
                                    .read(trainingDataProvider.call(db, partsId, partsTrainingId, date).notifier)
                                    .updateWeight(dataList[index], value),
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
                                initialValue: dataList[index].count?.toString() ?? "",
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                onChanged: (value) => ref
                                    .read(trainingDataProvider.call(db, partsId, partsTrainingId, date).notifier)
                                    .updateCount(dataList[index], value),
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "${dataList[index].rm?.toString() ?? ""}kg/RM",
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
                                            ref.read(trainingDataProvider.call(db, partsId, partsTrainingId, date).notifier).delete(dataList[index]);
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
                            ref.read(trainingDataProvider.call(db, partsId, partsTrainingId, date).notifier).updateRm(dataList[index]);
                          }
                        },
                      ),
                    ),
                  );
                },
                loading: () => [
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
                error: (error, stackTrace) => [Text('Error: $error')],
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: IconButton(
                  onPressed: () => ref.read(trainingDataProvider.call(db, partsId, partsTrainingId, date).notifier).addTraining(),
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
