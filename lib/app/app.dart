import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/router/router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appDataBaseProvider).initializedb();
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Muscular',
      theme: ThemeData(fontFamily: 'NotoSerifJP'),
      routerConfig: router,
    );
  }
}
