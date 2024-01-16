import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/main_page.dart';
import 'package:training_memo/app/repository/body_parts_mst_repository.dart';
import 'package:training_memo/app/training_select_page.dart';

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

@TypedGoRoute<TrainingSelectPageData>(path: '/tselect')
class TrainingSelectPageData extends GoRouteData {
  const TrainingSelectPageData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TrainingSelectPage(state.extra as BodyPartsMst);
  }
}
