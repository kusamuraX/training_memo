import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'app/app.dart';

void main() async {
  await openDatabase(join(await getDatabasesPath(), "training_memo.db"), onCreate: (db, version) {
    return db.execute("CREATE TABLE body_parts_mst (id INTEGER PRIMARY KEY, text TEXT, priority INTEGER)");
  }, version: 1);
  runApp(ProviderScope(child: const App()));
}
