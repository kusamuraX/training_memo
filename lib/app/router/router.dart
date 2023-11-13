import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/main_page.dart';

part 'router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) => GoRouter(
      navigatorKey: rootNavigatorKey,
      routes: $appRoutes,
      redirect: (context, state) {
        return MainPageRouteData.path;
      },
    );

@TypedGoRoute<MainPageRouteData>(path: MainPageRouteData.path)

// ROUTE定義
class MainPageRouteData extends GoRouteData {
  const MainPageRouteData();

  static const path = "/";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MainPage();
  }
}
