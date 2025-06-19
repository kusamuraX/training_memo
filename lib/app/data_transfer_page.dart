import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:training_memo/app/data/database.dart';

class DataTransferPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('データ引継ぎ'),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.file_download),
              label: Text('データのエクスポート'),
              onPressed: () => _exportData(context, ref),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.file_upload),
              label: Text('データのインポート'),
              onPressed: () => _importData(context, ref),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _exportData(BuildContext context, WidgetRef ref) async {
    try {
      final db = ref.read(appDataBaseProvider);

      // データベースからデータを取得
      final partsData = await db.select(db.bodyPartsInfo).get();
      final trainingData = await db.select(db.partsTrainingInfo).get();
      final trainingHistory = await db.select(db.trainingDataInfo).get();

      // JSONデータの作成
      final exportData = {
        'parts': partsData
            .map((e) => {
                  'parts_id': e.partsId,
                  'parts_name': e.partsName,
                })
            .toList(),
        'training': trainingData
            .map((e) => {
                  'body_parts_info': e.bodyPartsInfo,
                  'parts_training_id': e.partsTrainingId,
                  'training_name': e.trainingName,
                })
            .toList(),
        'history': trainingHistory
            .map((e) => {
                  'body_parts_info': e.bodyPartsInfo,
                  'parts_training_info': e.partsTrainingInfo,
                  'training_id': e.trainingId,
                  'training_date': e.trainingDate.toIso8601String(),
                  'weight': e.weight,
                  'rep': e.rep,
                  'rm': e.rm,
                  'memo': e.memo,
                })
            .toList(),
      };

      // ファイルの保存
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/training_memo_backup.json');
      await file.writeAsString(jsonEncode(exportData));

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('データをエクスポートしました: ${file.path}')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('エクスポートに失敗しました: $e')),
        );
      }
    }
  }

  Future<void> _importData(BuildContext context, WidgetRef ref) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null) {
        final file = File(result.files.single.path!);
        final jsonString = await file.readAsString();
        final jsonData = jsonDecode(jsonString);

        final db = ref.read(appDataBaseProvider);

        // 既存のデータを削除
        await db.transaction(() async {
          await db.delete(db.trainingDataInfo).go();
          await db.delete(db.partsTrainingInfo).go();
          await db.delete(db.bodyPartsInfo).go();

          // 新しいデータを挿入
          for (final part in (jsonData['parts'] as List)) {
            final partsId = part['parts_id'] as int;
            final partsName = part['parts_name'] as String;
            await db.into(db.bodyPartsInfo).insert(
                  BodyPartsInfoData(
                    partsId: partsId,
                    partsName: partsName,
                  ),
                );
          }

          for (final training in (jsonData['training'] as List)) {
            final bodyPartsInfo = training['body_parts_info'] as int;
            final partsTrainingId = training['parts_training_id'] as int;
            final trainingName = training['training_name'] as String;
            await db.into(db.partsTrainingInfo).insert(
                  PartsTrainingInfoData(
                    bodyPartsInfo: bodyPartsInfo,
                    partsTrainingId: partsTrainingId,
                    trainingName: trainingName,
                  ),
                );
          }

          for (final history in (jsonData['history'] as List)) {
            final bodyPartsInfo = history['body_parts_info'] as int;
            final partsTrainingInfo = history['parts_training_info'] as int;
            final trainingId = history['training_id'] as int;
            final trainingDate = DateTime.parse(history['training_date'] as String);
            final weight = history['weight'] as double?;
            final rep = history['rep'] as int?;
            final rm = history['rm'] as int?;
            final memo = history['memo'] as String?;
            await db.into(db.trainingDataInfo).insert(
                  TrainingDataInfoData(
                    bodyPartsInfo: bodyPartsInfo,
                    partsTrainingInfo: partsTrainingInfo,
                    trainingId: trainingId,
                    trainingDate: trainingDate,
                    weight: weight,
                    rep: rep,
                    rm: rm,
                    memo: memo,
                  ),
                );
          }
        });

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('データをインポートしました')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('インポートに失敗しました: $e')),
        );
      }
    }
  }
}
