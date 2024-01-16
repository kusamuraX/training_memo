import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_memo/app/provider/tab_index.dart';

import 'data/database.dart';

class MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: MainBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_sharp),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Etc',
          ),
        ],
        currentIndex: ref.watch(tabIndexProvider),
        onTap: (value) => ref.read(tabIndexProvider.notifier).setIndex(value),
      ),
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('トレーニング部位選択'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            childAspectRatio: 2,
            children: List.generate(dataSnapshot.data!.length, (index) {
              return GestureDetector(
                  child: Container(
                    color: Colors.blue[600],
                    child: Center(
                      child:
                          Text(dataSnapshot.data![index].partsName, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white)),
                    ),
                  ),
                  onTap: () => GoRouter.of(context).push('/tselect', extra: dataSnapshot.data![index]));
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
