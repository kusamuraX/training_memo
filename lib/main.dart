import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/router/router.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Windowsプラットフォームでのウィンドウサイズ設定
  if (Platform.isWindows) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(420, 900),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      windowButtonVisibility: true,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  final database = AppDataBase();
  await initializeDateFormatting('ja');
  runApp(
    ProviderScope(
      overrides: [appDataBaseProvider.overrideWithValue(database)],
      child: App(database),
    ),
  );
}

class App extends ConsumerWidget {
  final AppDataBase db;
  const App(this.db, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Muscular',
      theme: ThemeData(
        fontFamily: 'NotoSerifJP',
        brightness: Brightness.dark,
      ),
      routerConfig: router,
    );
  }
}
