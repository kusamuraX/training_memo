import 'dart:math';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/repository/body_parts_mst_repository.dart';
import 'package:training_memo/app/vmodel/main_page_model.dart';

part 'main_page_data.g.dart';

@riverpod
Future<MainPageModel> mainPageData(Ref ref, AppDataBase database, DateTime tgtDate) async {
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

  // 当日の部位別重量データ取得
  final todayStart = tgtDate.copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
  final todayEnd = tgtDate.copyWith(hour: 23, minute: 59, second: 59, millisecond: 999, microsecond: 999);

  final todayTrainingDataList =
      await (database.select(database.trainingDataInfo)..where((tbl) => tbl.trainingDate.isBiggerOrEqualValue(todayStart) & tbl.trainingDate.isSmallerOrEqualValue(todayEnd))).get();

  double todayChestTotal = 0;
  double todayBackTotal = 0;
  double todayShoulderTotal = 0;
  double todayArmTotal = 0;
  double todayAbsTotal = 0;
  double todayLegTotal = 0;

  for (var trainingData in todayTrainingDataList) {
    switch (trainingData.bodyPartsInfo) {
      case 0:
        todayChestTotal += (trainingData.weight ?? 0) * (trainingData.rep ?? 0);
        break;
      case 1:
        todayBackTotal += (trainingData.weight ?? 0) * (trainingData.rep ?? 0);
        break;
      case 2:
        todayShoulderTotal += (trainingData.weight ?? 0) * (trainingData.rep ?? 0);
        break;
      case 3:
        todayArmTotal += (trainingData.weight ?? 0) * (trainingData.rep ?? 0);
        break;
      case 4:
        todayAbsTotal += (trainingData.weight ?? 0) * (trainingData.rep ?? 0);
        break;
      case 5:
        todayLegTotal += (trainingData.weight ?? 0) * (trainingData.rep ?? 0);
        break;
      default:
        print('invalid id');
    }
  }

  todayChestTotal = double.parse((todayChestTotal / 1000).toStringAsFixed(2));
  todayBackTotal = double.parse((todayBackTotal / 1000).toStringAsFixed(2));
  todayShoulderTotal = double.parse((todayShoulderTotal / 1000).toStringAsFixed(2));
  todayArmTotal = double.parse((todayArmTotal / 1000).toStringAsFixed(2));
  todayAbsTotal = double.parse((todayAbsTotal / 1000).toStringAsFixed(2));
  todayLegTotal = double.parse((todayLegTotal / 1000).toStringAsFixed(2));

  PartsWeight todayData = PartsWeight(
      chestTotalWeight: todayChestTotal,
      backTotalWeight: todayBackTotal,
      shoulderTotalWeight: todayShoulderTotal,
      armTotalWeight: todayArmTotal,
      absTotalWeight: todayAbsTotal,
      legTotalWeight: todayLegTotal);

  // 過去8週分の部位別データ取得（グラフ用）
  List<PartsWeight> past8WeeksData = [];
  for (var i = 0; i < 8; i++) {
    // 0は今週、1は先週、...、7は8週前
    final startDayOfWeek = getStartDayOfWeek(tgtDate, prevNumber: i);
    final endDayOfWeek = startDayOfWeek.add(Duration(days: 6));
    final stDate = startDayOfWeek.copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
    final edDate = endDayOfWeek.copyWith(hour: 23, minute: 59, second: 59, millisecond: 999, microsecond: 999);
    final trainingDataList = await (database.select(database.trainingDataInfo)..where((tbl) => tbl.trainingDate.isBiggerOrEqualValue(stDate) & tbl.trainingDate.isSmallerOrEqualValue(edDate))).get();

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

    past8WeeksData.insert(
        0, PartsWeight(chestTotalWeight: chestTotal, backTotalWeight: backTotal, shoulderTotalWeight: shoulderTotal, armTotalWeight: armTotal, absTotalWeight: absTotal, legTotalWeight: legTotal));
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
    final trainingDataList = await (database.select(database.trainingDataInfo)..where((tbl) => tbl.trainingDate.isBiggerOrEqualValue(stDate) & tbl.trainingDate.isSmallerOrEqualValue(edDate))).get();
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
    weekData
        .add(PartsWeight(chestTotalWeight: chestTotal, backTotalWeight: backTotal, shoulderTotalWeight: shoulderTotal, armTotalWeight: armTotal, absTotalWeight: absTotal, legTotalWeight: legTotal));
  }
  double graphMaxScale = (maxValue + (maxValue * 0.3)).toDouble();
  return MainPageModel(today: tgtDate, bodyPartsList: bodyPartsList, weekWeightList: weekData, todayData: todayData, past8WeeksData: past8WeeksData, maxScale: graphMaxScale);
}

DateTime getStartDayOfWeek(DateTime date, {int prevNumber = 0}) => date.subtract(Duration(days: (date.weekday - 1) + (prevNumber * 7)));
