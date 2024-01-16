import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/repository/body_parts_mst_repository.dart';

class TrainingSelectPage extends ConsumerWidget {
  final BodyPartsMst bodyParts;

  TrainingSelectPage(this.bodyParts, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: TrainingSelectPageAppBar(bodyParts.partsName),
      body: _TrainingSelectWidget(bodyParts.partsId),
    );
  }
}

class TrainingSelectPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String partsName;
  const TrainingSelectPageAppBar(this.partsName, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("$partsName トレーニング"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}

class _TrainingSelectWidget extends ConsumerWidget {
  final int partsId;
  const _TrainingSelectWidget(this.partsId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final databaseProvider = ref.watch(appDataBaseProvider);
    return FutureBuilder(
      future: databaseProvider.retrievePartTrainingList(partsId),
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.done) {
          return GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2,
            children: List.generate(dataSnapshot.data!.length, (index) {
              return GestureDetector(
                  child: Container(
                    color: Colors.blue[600],
                    child: Center(
                      child: Text(dataSnapshot.data![index].trainingName,
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white)),
                    ),
                  ),
                  onTap: () => {});
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
