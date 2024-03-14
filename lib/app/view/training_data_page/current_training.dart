import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/provider/training_data.dart';

class CurrentTrainingWidget extends ConsumerWidget {
  final int partsId;
  final int partsTrainingId;
  final DateTime date;

  CurrentTrainingWidget({super.key, required this.partsId, required this.partsTrainingId, required this.date});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDataBaseProvider);
    final trainingInfoListSync = ref.watch(trainingDataProvider.call(db, partsId, partsTrainingId, date));
    return trainingInfoListSync.when(
      data: (dataList) => ListView(
        children: [
          ...List.generate(
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
                    Text(
                      "${index + 1} Set",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: '重量',
                          suffix: Text('㎏'),
                          contentPadding: EdgeInsets.only(top: 4, bottom: 4, left: 2, right: 2),
                          isDense: true,
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                        textAlign: TextAlign.right,
                        initialValue: dataList[index].weight?.toString() ?? "",
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d*)?'))],
                        onChanged: (value) =>
                            ref.read(trainingDataProvider.call(db, partsId, partsTrainingId, date).notifier).updateWeight(dataList[index], value),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "回数",
                          suffix: Text("回"),
                          contentPadding: EdgeInsets.only(top: 4, bottom: 4, left: 2, right: 2),
                          isDense: true,
                        ),
                        textAlign: TextAlign.right,
                        initialValue: dataList[index].count?.toString() ?? "",
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        onChanged: (value) =>
                            ref.read(trainingDataProvider.call(db, partsId, partsTrainingId, date).notifier).updateCount(dataList[index], value),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "${dataList[index].rm?.toString() ?? ""}㎏/RM",
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
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
