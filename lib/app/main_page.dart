import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_memo/app/repository/body_parts_mst_repository.dart';

import 'data/database.dart';

class MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final databaseProvider = ref.watch(appDataBaseProvider);
    return Scaffold(
        appBar: const MainAppBar(),
        body: FutureBuilder(
            future: databaseProvider.retrieveBodyPartsMstList(),
            builder: (ctx, dataSnapshot) {
              if (dataSnapshot.connectionState == ConnectionState.done) {
                return Row(
                  children: List.generate(dataSnapshot.data!.length, (index) => Text(dataSnapshot.data![index].partsName)),
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
            }));
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('AppBar'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}

class _MainBody extends StatelessWidget {
  final List<BodyPartsMst> items;
  const _MainBody({required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          child: Text(''),
        )
      ],
    );
  }
}
