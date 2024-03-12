import 'dart:math';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/repository/body_parts_mst_repository.dart';
import 'package:training_memo/app/vmodel/main_page_model.dart';

part 'main_page_data.g.dart';

@riverpod
Future<MainPageModel> mainPageData(MainPageDataRef ref, AppDataBase database, DateTime tgtDate) async {
  // 部位情報取得
  final partsList = await database.select(database.bodyPartsInfo).get();
  final List<BodyPartsMst> bodyPartsList = [];
  for (final parts in partsList) {
    final latestTrainigInfoList = await (database.select(database.trainingDataInfo)
          ..where((tbl) => tbl.bodyPartsInfo.equals(parts.partsId))
          ..limit(1)
          ..orderBy([(t) => OrderingTerm(expression: t.trainingDate, mode: OrderingMode.desc)]))
        .get();
    String lastDate = '-';
    if (latestTrainigInfoList.isNotEmpty) {
      final bfDay = DateUtils.dateOnly(DateTime.now()).difference(DateUtils.dateOnly(latestTrainigInfoList[0].trainingDate)).inDays;
      lastDate = "$bfDay日前";
    }
    bodyPartsList.add(BodyPartsMst(partsId: parts.partsId, partsName: parts.partsName, lastTrainingDate: lastDate));
  }
  // サマリ情報取得
  double maxValue = 0;
  List<PartsWeight> weekData = [];
  for (var i = 0; i < 2; i++) {
    // 0は今週、1は先週
    final startDayOfWeek = getStartDayOfWeek(tgtDate, prevNumber: i);
    final endDayOfWeek = startDayOfWeek.add(Duration(days: 6));
    final stDate = startDayOfWeek.copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
    final edDate = endDayOfWeek.copyWith(hour: 23, minute: 59, second: 59, millisecond: 999, microsecond: 999);
    print('get $stDate - $edDate');
    final trainingDataList = await (database.select(database.trainingDataInfo)
          ..where((tbl) => tbl.trainingDate.isBiggerOrEqualValue(stDate) & tbl.trainingDate.isSmallerOrEqualValue(edDate)))
        .get();
    double chestTotal = 0;
    double backTotal = 0;
    double shoulderTotal = 0;
    double armTotal = 0;
    double absTotal = 0;
    double legTotal = 0;
    for (var trainingData in trainingDataList) {
      switch (trainingData.bodyPartsInfo) {
        case 0:
          chestTotal += (trainingData.weight ?? 0) * (trainingData.rep ?? 0);
          break;
        case 1:
          backTotal += (trainingData.weight ?? 0) * (trainingData.rep ?? 0);
          break;
        case 2:
          shoulderTotal += (trainingData.weight ?? 0) * (trainingData.rep ?? 0);
          break;
        case 3:
          armTotal += (trainingData.weight ?? 0) * (trainingData.rep ?? 0);
          break;
        case 4:
          absTotal += (trainingData.weight ?? 0) * (trainingData.rep ?? 0);
          break;
        case 5:
          legTotal += (trainingData.weight ?? 0) * (trainingData.rep ?? 0);
          break;
        default:
          print('invalid id');
      }
    }
    chestTotal = double.parse((chestTotal / 1000).toStringAsFixed(2));
    backTotal = double.parse((backTotal / 1000).toStringAsFixed(2));
    shoulderTotal = double.parse((shoulderTotal / 1000).toStringAsFixed(2));
    armTotal = double.parse((armTotal / 1000).toStringAsFixed(2));
    absTotal = double.parse((absTotal / 1000).toStringAsFixed(2));
    legTotal = double.parse((legTotal / 1000).toStringAsFixed(2));
    maxValue = [chestTotal, backTotal, shoulderTotal, armTotal, absTotal, legTotal, maxValue].reduce(max);
    weekData.add(PartsWeight(
        chestTotalWeight: chestTotal,
        backTotalWeight: backTotal,
        shoulderTotalWeight: shoulderTotal,
        armTotalWeight: armTotal,
        absTotalWeight: absTotal,
        legTotalWeight: legTotal));
  }
  double graphMaxScale = (maxValue + (maxValue * 0.3)).toInt().toDouble();
  return MainPageModel(today: tgtDate, bodyPartsList: bodyPartsList, weekWeightList: weekData, maxScale: graphMaxScale);
}

DateTime getStartDayOfWeek(DateTime date, {int prevNumber = 0}) => date.subtract(Duration(days: date.weekday + (prevNumber * 7)));
