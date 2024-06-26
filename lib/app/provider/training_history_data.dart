import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/vmodel/event_model.dart';
import 'package:training_memo/app/vmodel/history_view_model.dart';

part 'training_history_data.g.dart';

@riverpod
class TrainingHistoryData extends _$TrainingHistoryData {
  @override
  HistoryDataViewModel build(AppDataBase database) {
    final today = DateTime.now();
    final historyMap = LinkedHashMap<DateTime, List<EventModel>>(
      equals: isSameDay,
      hashCode: getHashCode,
    );
    getInitHistory(today);
    return HistoryDataViewModel(historyDataMap: historyMap, selectDate: today);
  }

  Future<void> getInitHistory(DateTime date) async {
    var stDate = DateUtils.dateOnly(DateTime.utc(date.year, date.month, 1));
    final edDate = DateUtils.dateOnly(DateTime.utc(date.year, date.month, DateTime.utc(date.year, date.month + 1, 0).day));
    final newHistoryMap = LinkedHashMap<DateTime, List<EventModel>>(
      equals: isSameDay,
      hashCode: getHashCode,
    );
    final query = database.select(database.trainingDataInfo).join([
      innerJoin(database.partsTrainingInfo, database.partsTrainingInfo.partsTrainingId.equalsExp(database.trainingDataInfo.partsTrainingInfo)),
      innerJoin(database.bodyPartsInfo, database.bodyPartsInfo.partsId.equalsExp(database.trainingDataInfo.bodyPartsInfo)),
    ])
      ..where(database.trainingDataInfo.trainingDate.isBiggerOrEqualValue(stDate) &
          database.trainingDataInfo.trainingDate.isSmallerOrEqualValue(edDate) &
          database.trainingDataInfo.rm.isNotNull());
    final historyDataList = await query.get().then((rows) {
      return rows.map((row) {
        return TrainingDataWithAll(
            row.readTable(database.bodyPartsInfo), row.readTable(database.partsTrainingInfo), row.readTable(database.trainingDataInfo));
      }).toList();
    });
    while (stDate.compareTo(edDate) <= 0) {
      final eventDataList = <EventModel>[];
      for (final historyData in historyDataList) {
        if (historyData.trainingDataInfo.trainingDate.month == stDate.month && historyData.trainingDataInfo.trainingDate.day == stDate.day) {
          final partsIdList = eventDataList.map((eventData) => eventData.partsId);
          if (partsIdList.contains(historyData.trainingDataInfo.bodyPartsInfo)) {
            final eventData = eventDataList.firstWhere((element) => historyData.trainingDataInfo.bodyPartsInfo == element.partsId);
            if (eventData.trainingMap.containsKey(historyData.partsTrainingInfo.trainingName)) {
              eventData.trainingMap[historyData.partsTrainingInfo.trainingName]?.add(historyData.trainingDataInfo);
            } else {
              final newEntry = <String, List<dynamic>>{
                historyData.partsTrainingInfo.trainingName: [historyData.trainingDataInfo]
              };
              newEntry.addEntries(eventData.trainingMap.entries);
              eventDataList.removeWhere((element) => historyData.trainingDataInfo.bodyPartsInfo == element.partsId);
              eventDataList.add(eventData.copyWith(trainingMap: newEntry));
            }
          } else {
            // 部位が存在していない場合追加
            final trainingMap = {
              historyData.partsTrainingInfo.trainingName: [historyData.trainingDataInfo]
            };
            eventDataList.add(EventModel(
                partsId: historyData.trainingDataInfo.bodyPartsInfo, partsName: historyData.bodyPartsInfo.partsName, trainingMap: trainingMap));
          }
        }
      }
      eventDataList.sort((a, b) => a.partsId.compareTo(b.partsId));
      if (newHistoryMap[stDate]?.length != eventDataList.length) {
        newHistoryMap[stDate] = eventDataList;
      }
      // 既にみた日付のものは削除
      historyDataList.removeWhere(
          (element) => element.trainingDataInfo.trainingDate.month == stDate.month && element.trainingDataInfo.trainingDate.day == stDate.day);
      stDate = stDate.add(Duration(days: 1));
    }
    state = state.copyWith(historyDataMap: newHistoryMap);
  }

  Future<void> getHistory(DateTime date) async {
    var stDate = DateUtils.dateOnly(DateTime.utc(date.year, date.month, 1));
    final edDate = DateUtils.dateOnly(DateTime.utc(date.year, date.month, DateTime.utc(date.year, date.month + 1, 0).day));
    final newHistoryMap = state.historyDataMap;

    if (!newHistoryMap.containsKey(stDate)) {
      final query = database.select(database.trainingDataInfo).join([
        innerJoin(database.partsTrainingInfo, database.partsTrainingInfo.partsTrainingId.equalsExp(database.trainingDataInfo.partsTrainingInfo)),
        innerJoin(database.bodyPartsInfo, database.bodyPartsInfo.partsId.equalsExp(database.trainingDataInfo.bodyPartsInfo)),
      ])
        ..where(database.trainingDataInfo.trainingDate.isBiggerOrEqualValue(stDate) &
            database.trainingDataInfo.trainingDate.isSmallerOrEqualValue(edDate) &
            database.trainingDataInfo.rm.isNotNull());
      final historyDataList = await query.get().then((rows) {
        return rows.map((row) {
          return TrainingDataWithAll(
              row.readTable(database.bodyPartsInfo), row.readTable(database.partsTrainingInfo), row.readTable(database.trainingDataInfo));
        }).toList();
      });
      // final historyDataList = await (database.select(database.trainingDataInfo).join([
      //   innerJoin(database.partsTrainingInfo, database.partsTrainingInfo.partsTrainingId.equalsExp(database.trainingDataInfo.partsTrainingInfo)),
      //   innerJoin(database.bodyPartsInfo, database.bodyPartsInfo.partsId.equalsExp(database.trainingDataInfo.bodyPartsInfo)),
      // ])
      //       ..where((tbl) => tbl.trainingDate.isBiggerOrEqualValue(stDate) & tbl.trainingDate.isSmallerOrEqualValue(edDate)))
      //     .get();
      while (stDate.compareTo(edDate) <= 0) {
        final eventDataList = <EventModel>[];
        for (final historyData in historyDataList) {
          if (historyData.trainingDataInfo.trainingDate.month == stDate.month && historyData.trainingDataInfo.trainingDate.day == stDate.day) {
            final partsIdList = eventDataList.map((eventData) => eventData.partsId);
            if (partsIdList.contains(historyData.trainingDataInfo.bodyPartsInfo)) {
              final eventData = eventDataList.firstWhere((element) => historyData.trainingDataInfo.bodyPartsInfo == element.partsId);
              if (eventData.trainingMap.containsKey(historyData.partsTrainingInfo.trainingName)) {
                eventData.trainingMap[historyData.partsTrainingInfo.trainingName]?.add(historyData.trainingDataInfo);
              } else {
                final newEntry = <String, List<dynamic>>{
                  historyData.partsTrainingInfo.trainingName: [historyData.trainingDataInfo]
                };
                newEntry.addEntries(eventData.trainingMap.entries);
                eventDataList.removeWhere((element) => historyData.trainingDataInfo.bodyPartsInfo == element.partsId);
                eventDataList.add(eventData.copyWith(trainingMap: newEntry));
              }
              // 部位が存在している場合は更新
              // for (var eventData in eventDataList) {
              //   // 同一の部位が存在する場合
              //   if (eventData.partsId == historyData.trainingDataInfo.bodyPartsInfo) {
              //     final trainingMap = eventData.trainingList;
              //     if (eventData.trainingList.containsKey(historyData.partsTrainingInfo.trainingName)) {
              //       // 同一のトレーニングがある場合
              //       trainingMap[historyData.partsTrainingInfo.trainingName]?.add(historyData.trainingDataInfo);
              //     } else {
              //       // 同一のトレーニングがない場合
              //       trainingMap[historyData.partsTrainingInfo.trainingName] = [historyData.trainingDataInfo];
              //     }
              //     eventData = eventData.copyWith(trainingList: trainingMap);
              //     break;
              //   }
              // }
            } else {
              // 部位が存在していない場合追加
              final trainingMap = {
                historyData.partsTrainingInfo.trainingName: [historyData.trainingDataInfo]
              };
              eventDataList.add(EventModel(
                  partsId: historyData.trainingDataInfo.bodyPartsInfo, partsName: historyData.bodyPartsInfo.partsName, trainingMap: trainingMap));
            }
          }
        }
        eventDataList.sort((a, b) => a.partsId.compareTo(b.partsId));
        if (newHistoryMap[stDate]?.length != eventDataList.length) {
          newHistoryMap[stDate] = eventDataList;
        }
        // 既にみた日付のものは削除
        historyDataList.removeWhere(
            (element) => element.trainingDataInfo.trainingDate.month == stDate.month && element.trainingDataInfo.trainingDate.day == stDate.day);
        stDate = stDate.add(Duration(days: 1));
      }
      if (!mapEquals(newHistoryMap, state.historyDataMap)) {
        state = state.copyWith(historyDataMap: newHistoryMap);
      }
    }
  }

  Future<void> changeDate(DateTime newDate) async {
    state = state.copyWith(selectDate: newDate);
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
