import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/provider/prev_training_data.dart';
import 'package:training_memo/app/widget/title_container.dart';

class PrevTrainingWidget extends ConsumerWidget {
  final int partsId;
  final int partsTrainingId;
  final DateTime date;
  final int maxRm;

  PrevTrainingWidget({super.key, required this.partsId, required this.partsTrainingId, required this.date, required this.maxRm});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDataBaseProvider);
    final prevTrainingInfoListSync = ref.watch(prevTrainingDataProvider.call(db, partsId, partsTrainingId, date));
    final rate87 = (maxRm * 0.87).toInt();
    final rate70 = (maxRm * 0.7).toInt();
    final rate60 = (maxRm * 0.6).toInt();
    return prevTrainingInfoListSync.when(
      data: (prevTrainingInfoList) => Visibility(
        visible: prevTrainingInfoList.isNotEmpty,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border(bottom: const BorderSide(width: 1, color: Colors.white)),
          ),
          width: double.infinity,
          padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 16),
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
    );
  }
}
