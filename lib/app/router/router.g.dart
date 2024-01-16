// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainPageRouteData,
      $trainingSelectPageData,
    ];

RouteBase get $mainPageRouteData => GoRouteData.$route(
      path: '/',
      factory: $MainPageRouteDataExtension._fromState,
    );

extension $MainPageRouteDataExtension on MainPageRouteData {
  static MainPageRouteData _fromState(GoRouterState state) =>
      const MainPageRouteData();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $trainingSelectPageData => GoRouteData.$route(
      path: '/tselect',
      factory: $TrainingSelectPageDataExtension._fromState,
    );

extension $TrainingSelectPageDataExtension on TrainingSelectPageData {
  static TrainingSelectPageData _fromState(GoRouterState state) =>
      const TrainingSelectPageData();

  String get location => GoRouteData.$location(
        '/tselect',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'7a148586d383d01203f906b7c59e315d16a0eb57';

/// See also [router].
@ProviderFor(router)
final routerProvider = AutoDisposeProvider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
