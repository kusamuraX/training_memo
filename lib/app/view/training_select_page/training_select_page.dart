import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/provider/parts_training_menu.dart';
import 'package:training_memo/app/repository/body_parts_mst_repository.dart';

class TrainingSelectPage extends ConsumerWidget {
  final BodyPartsMst bodyParts;
  final DateTime date;

  TrainingSelectPage(this.bodyParts, this.date, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: TrainingSelectPageAppBar(bodyParts.partsName),
      body: _TrainingSelectWidget(bodyParts.partsId, date),
    );
  }
}

class TrainingSelectPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String partsName;

  const TrainingSelectPageAppBar(this.partsName, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "$partsNameトレーニング",
      ),
      bottomOpacity: 0.0,
      elevation: 0.0,
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
                padding: EdgeInsets.only(top: 12, bottom: 12),
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
                        "最大RM：${menuList[index].maxRm ?? "-"} ㎏",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                GoRouter.of(context).push('/training', extra: {'training': menuList[index], 'date': date});
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
