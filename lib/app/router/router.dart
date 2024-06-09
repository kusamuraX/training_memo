import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/repository/body_parts_mst_repository.dart';
import 'package:training_memo/app/repository/parts_training_info_repository.dart';
import 'package:training_memo/app/settings_page.dart';
import 'package:training_memo/app/view/main_page/main_page.dart';
import 'package:training_memo/app/view/parts_select_page.dart';
import 'package:training_memo/app/view/training_data_page/training_page.dart';
import 'package:training_memo/app/view/training_select_page/training_select_page.dart';

part 'router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) => GoRouter(
      navigatorKey: rootNavigatorKey,
      routes: $appRoutes,
    );

// ROUTE定義
@TypedGoRoute<MainPageRouteData>(path: '/')
class MainPageRouteData extends GoRouteData {
  const MainPageRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MainPage();
  }
}

@TypedGoRoute<PartsSelectPageData>(path: '/parts-select')
class PartsSelectPageData extends GoRouteData {
  const PartsSelectPageData();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    Map<String, Object> argMap = state.extra as Map<String, Object>;
    return PartsSelectPage(argMap['date'] as DateTime);
  }
}


@TypedGoRoute<TrainingSelectPageData>(path: '/tselect')
class TrainingSelectPageData extends GoRouteData {
  const TrainingSelectPageData();
  // 部位トレーニングの選択画面への遷移
  @override
  Widget build(BuildContext context, GoRouterState state) {
    Map<String, Object> argMap = state.extra as Map<String, Object>;
    BodyPartsMst bodyPartsMst;
    if (argMap['parts'] is BodyPartsInfoData) {
      BodyPartsInfoData bodyPartsInfo = argMap['parts'] as BodyPartsInfoData;
      bodyPartsMst = BodyPartsMst(partsId: bodyPartsInfo.partsId, partsName: bodyPartsInfo.partsName);
    } else {
      bodyPartsMst = argMap['parts'] as BodyPartsMst;
    }
    DateTime date = argMap['date'] as DateTime;
    return TrainingSelectPage(bodyPartsMst, date);
  }
}

@TypedGoRoute<TrainingPageData>(path: '/training')
class TrainingPageData extends GoRouteData {
  const TrainingPageData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    Map<String, Object> argMap = state.extra as Map<String, Object>;
    return TrainingPage(argMap['training'] as PartsTrainingMenuInfo, argMap['date'] as DateTime);
  }
}

@TypedGoRoute<SettingPartsSelectPageData>(path: '/setting-parts-select')
class SettingPartsSelectPageData extends GoRouteData {
  const SettingPartsSelectPageData();
  // 設定 - 部位選択
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingPartsSelectPage();
  }
}

@TypedGoRoute<SettingTrainingPageData>(path: '/edit-training')
class SettingTrainingPageData extends GoRouteData {
  const SettingTrainingPageData();
  // 設定 - トレーニング編集
  @override
  Widget build(BuildContext context, GoRouterState state) {
    Map<String, Object> argMap = state.extra as Map<String, Object>;
    final partsInfo = argMap['partsInfo'] as BodyPartsInfoData;
    return EditTrainingPage(partsInfo.partsId, partsInfo.partsName);
  }
}
