import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/provider/main_page_data.dart';
import 'package:training_memo/app/provider/parts_training_menu.dart';
import 'package:training_memo/app/repository/body_parts_mst_repository.dart';

class TrainingSelectPage extends ConsumerWidget {
  final BodyPartsMst bodyParts;
  final DateTime date;

  TrainingSelectPage(this.bodyParts, this.date, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: TrainingSelectPageAppBar(bodyParts.partsName, ref),
      body: _TrainingSelectWidget(bodyParts.partsId, date),
    );
  }
}

class TrainingSelectPageAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String partsName;
  final WidgetRef ref;

  const TrainingSelectPageAppBar(this.partsName, this.ref, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(
        "$partsNameトレーニング",
      ),
      bottomOpacity: 0.0,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // メインページのデータを無効化して最新データを反映
          final db = ref.read(appDataBaseProvider);
          final today = DateUtils.dateOnly(DateTime.now());
          ref.invalidate(mainPageDataProvider.call(db, today));

          // メインページに戻る
          GoRouter.of(context).go('/');
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}

class _TrainingSelectWidget extends ConsumerWidget {
  final int partsId;
  final DateTime date;
  const _TrainingSelectWidget(this.partsId, this.date);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDataBaseProvider);
    final bodyPartsListAsyncValue = ref.watch(partsTrainingMenuListProvider.call(db, partsId));
    return bodyPartsListAsyncValue.when(
      data: (menuList) {
        return ListView(
          children: List.generate(menuList.length, (index) {
            return GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(menuList[index].trainingName, style: TextStyle(fontSize: 18), overflow: TextOverflow.ellipsis),
                      Text(
                        "最大RM : ${menuList[index].maxRm ?? "-"} ㎏",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () async {
                // トレーニングページに遷移
                await GoRouter.of(context).push('/training', extra: {'training': menuList[index], 'date': date});

                // トレーニングページから戻ってきた時にデータを更新
                final db = ref.read(appDataBaseProvider);
                ref.invalidate(partsTrainingMenuListProvider.call(db, partsId));
              },
            );
          }),
        );
      },
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
