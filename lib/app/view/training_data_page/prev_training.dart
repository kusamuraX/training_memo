import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/provider/prev_training_data.dart';
import 'package:training_memo/app/widget/title_container.dart';

class PrevTrainingWidget extends ConsumerWidget {
  final int partsId;
  final int partsTrainingId;
  final DateTime date;
  final DateFormat dateStrFormat = DateFormat('MM/dd');

  PrevTrainingWidget({super.key, required this.partsId, required this.partsTrainingId, required this.date});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDataBaseProvider);
    final prevTrainingInfoListSync = ref.watch(prevTrainingDataProvider.call(db, partsId, partsTrainingId, date));
    return prevTrainingInfoListSync.when(
      data: (prevTrainingInfoList) => Visibility(
        visible: prevTrainingInfoList.isNotEmpty,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border(bottom: const BorderSide(width: 1, color: Colors.white)),
          ),
          width: double.infinity,
          padding: EdgeInsets.only(top: 8, left: 4, right: 4, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              prevTrainingInfoList.length,
              (index) => TitleContaier(
                title: '[ ${dateStrFormat.format(prevTrainingInfoList[index].trainingDate)} ]',
                titleTextSize: 13,
                padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                bgColor: Theme.of(context).primaryColor,
                child: Table(columnWidths: <int, TableColumnWidth>{
                  0: FixedColumnWidth(15),
                  1: FixedColumnWidth(50),
                  2: IntrinsicColumnWidth(),
                }, children: [
                  TableRow(
                    decoration: BoxDecoration(border: Border(bottom: const BorderSide(width: 1, color: Colors.white))),
                    children: [
                      Text("", style: TextStyle(color: Colors.white, fontSize: 12)),
                      Text("重量", style: TextStyle(color: Colors.white, fontSize: 12)),
                      Text("回数", style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  ...List.generate(
                    prevTrainingInfoList[index].trainingList.length,
                    (tindex) => TableRow(children: [
                      Text('${tindex + 1}', style: TextStyle(color: Colors.white, fontSize: 10)),
                      Text('${prevTrainingInfoList[index].trainingList[tindex].weight} ㎏', style: TextStyle(color: Colors.white, fontSize: 10)),
                      Text('${prevTrainingInfoList[index].trainingList[tindex].rep} 回', style: TextStyle(color: Colors.white, fontSize: 10)),
                    ]),
                  ),
                  TableRow(
                    decoration: BoxDecoration(border: Border(top: const BorderSide(width: 1, color: Colors.white))),
                    children: [
                      Text(""),
                      Text("総重量", style: TextStyle(color: Colors.white, fontSize: 10)),
                      Text("${prevTrainingInfoList[index].totalWeight} t", style: TextStyle(color: Colors.white, fontSize: 10)),
                    ],
                  ),
                ]),
              ),
            ),
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
