import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training_memo/app/data/database.dart';

@Riverpod(keepAlive: true)
AppDataBase appDataBase(Ref ref) {
  return AppDataBase();
}
