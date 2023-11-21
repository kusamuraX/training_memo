import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/database.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const MainAppBar(), body: MainBody());
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

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return TableCalendar(
    //   firstDay: DateTime.utc(2023, 1, 1),
    //   lastDay: DateTime.utc(2033, 12, 31),
    //   focusedDay: DateTime.now(),
    // );
    return _PartsSelectWidget();
  }
}

class _PartsSelectWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final databaseProvider = ref.watch(appDataBaseProvider);
    return FutureBuilder(
      future: databaseProvider.retrieveBodyPartsMstList(),
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.done) {
          return GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(dataSnapshot.data!.length, (index) {
              return Container(
                color: Colors.blue[600],
                child: Center(
                  child: Text(dataSnapshot.data![index].partsName, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white)),
                ),
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
