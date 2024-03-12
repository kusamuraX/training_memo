import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/provider/training_history_data.dart';
import 'package:training_memo/app/vmodel/event_model.dart';
import 'package:training_memo/app/widget/title_container.dart';

const iconColors = {
  0: Colors.amber,
  1: Colors.blue,
  2: Colors.green,
  3: Colors.pinkAccent,
  4: Color.fromARGB(255, 59, 255, 209),
  5: Colors.orangeAccent
};

class HistoryBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build history');
    final db = ref.watch(appDataBaseProvider);
    final trainingHistoryData = ref.watch(trainingHistoryDataProvider.call(db));
    return FutureBuilder(
      future: ref.read(trainingHistoryDataProvider.call(db).notifier).getHistory(trainingHistoryData.selectDate),
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              TableCalendar(
                locale: 'ja_JP',
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: trainingHistoryData.selectDate,
                selectedDayPredicate: (day) {
                  return isSameDay(trainingHistoryData.selectDate, day);
                },
                eventLoader: (day) {
                  return trainingHistoryData.historyDataMap[day] ?? [];
                },
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  ref.read(trainingHistoryDataProvider.call(db).notifier).changeDate(selectedDay);
                },
                onPageChanged: (focusedDay) {
                  // 月の変更
                  ref.read(trainingHistoryDataProvider.call(db).notifier).getHistory(focusedDay);
                },
                calendarBuilders: CalendarBuilders(
                  dowBuilder: (context, day) {
                    if (day.weekday == DateTime.sunday) {
                      return Center(
                        child: Text(
                          DateFormat.E('ja').format(day),
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (day.weekday == DateTime.saturday) {
                      return Center(
                        child: Text(
                          DateFormat.E('ja').format(day),
                          style: const TextStyle(color: Colors.blue),
                        ),
                      );
                    }
                    return null;
                  },
                  markerBuilder: (context, day, events) {
                    if (events.isNotEmpty) {
                      return Positioned(
                        bottom: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: events.map((e) {
                            return Container(
                              decoration: BoxDecoration(color: iconColors[(e as EventModel).partsId], shape: BoxShape.circle),
                              padding: EdgeInsets.all(4),
                            );
                          }).toList(),
                        ),
                      );
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ...?trainingHistoryData.historyDataMap[trainingHistoryData.selectDate]?.map((e) {
                      if (e is EventModel) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: iconColors[e.partsId]!),
                            borderRadius: BorderRadiusDirectional.circular(8),
                          ),
                          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                          child: Column(
                            children: [
                              Text(e.partsName),
                              ...e.trainingMap.entries
                                  .map((t) => TitleContaier(
                                        title: t.key,
                                        titleTextColor: Theme.of(context).colorScheme.onBackground,
                                        bgColor: Theme.of(context).primaryColor,
                                        padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: iconColors[e.partsId]!),
                                          borderRadius: BorderRadiusDirectional.circular(8),
                                        ),
                                        child: Table(
                                          columnWidths: <int, TableColumnWidth>{
                                            0: FlexColumnWidth(0.4),
                                            1: FlexColumnWidth(1),
                                            2: FlexColumnWidth(1),
                                            3: FlexColumnWidth(1),
                                          },
                                          children: t.value.asMap().entries.map((entry) {
                                            final index = entry.key + 1;
                                            final tdata = entry.value as TrainingDataInfoData;
                                            return TableRow(children: [
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: RichText(
                                                  text: TextSpan(
                                                      style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 10),
                                                      children: [
                                                        TextSpan(
                                                            text: index.toString().padLeft(3, " "),
                                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                                        const TextSpan(text: ' Set'),
                                                      ]),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: RichText(
                                                  text: TextSpan(
                                                      style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 10),
                                                      children: [
                                                        TextSpan(
                                                            text: tdata.weight.toString().padLeft(6, " "),
                                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                                        const TextSpan(text: ' kg'),
                                                      ]),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: RichText(
                                                  text: TextSpan(
                                                      style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 10),
                                                      children: [
                                                        TextSpan(
                                                            text: tdata.rep.toString().padLeft(3, " "),
                                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                                        const TextSpan(text: ' 回'),
                                                      ]),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: RichText(
                                                  text: TextSpan(
                                                      style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 10),
                                                      children: [
                                                        TextSpan(
                                                            text: tdata.rm.toString().padLeft(6, " "),
                                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                                        const TextSpan(text: ' kg/RM'),
                                                      ]),
                                                ),
                                              ),
                                            ]);
                                          }).toList(),
                                        ),
                                      ))
                                  .toList()
                            ],
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    }).toList()
                  ],
                ),
              ),
            ],
          );
        } else if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              TableCalendar(
                locale: 'ja_JP',
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: trainingHistoryData.selectDate,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: Text('error'),
          );
        }
      },
    );
  }
}
