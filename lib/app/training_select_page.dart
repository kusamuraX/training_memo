import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_memo/app/data/parts_training_database.dart';
import 'package:training_memo/app/provider/training_data.dart';
import 'package:training_memo/app/repository/body_parts_mst_repository.dart';

class TrainingSelectPage extends ConsumerWidget {
  final BodyPartsMst bodyParts;
  final String date;

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
      title: Text("$partsNameトレーニング"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}

class _TrainingSelectWidget extends ConsumerWidget {
  final int partsId;
  final String date;
  const _TrainingSelectWidget(this.partsId, this.date);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final databaseProvider = ref.watch(partsTrainingDataBaseProvider);
    return FutureBuilder(
      future: databaseProvider.retrievePartTrainingList(partsId),
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: List.generate(dataSnapshot.data!.length, (index) {
              return GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 24, 52, 76),
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          dataSnapshot.data![index].trainingName,
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        Text(
                          "最大RM：${dataSnapshot.data![index].maxRm ?? "-"}㎏",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  ref.watch(trainingDataProvider.notifier).getAll(dataSnapshot.data![index].partsId, dataSnapshot.data![index].partsTrainingId, date);
                  GoRouter.of(context).push('/training', extra: {'training': dataSnapshot.data![index], 'date': date});
                },
              );
            }),
          );
        } else if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text('error'),
          );
        }
      },
    );
  }
}
