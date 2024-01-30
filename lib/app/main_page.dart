import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:training_memo/app/data/body_parts_database.dart';
import 'package:training_memo/app/provider/tab_index.dart';

class MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabContents = [MainBody(), HistoryBody(), SettingBody()];
    final tabTitles = ["トレーニング部位選択", "トレーニング履歴", "設定"];
    return Scaffold(
      appBar: MainAppBar(tabTitles.elementAt(ref.watch(tabIndexProvider))),
      body: tabContents.elementAt(ref.watch(tabIndexProvider)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_sharp),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: ref.watch(tabIndexProvider),
        onTap: (value) => ref.read(tabIndexProvider.notifier).setIndex(value),
      ),
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MainAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
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
    final today = DateTime.now();
    final todayStr = DateFormat('yyyy-MM-dd').format(today);
    final databaseProvider = ref.watch(bodyPartsDataBaseProvider);
    return FutureBuilder(
      future: databaseProvider.retrieveBodyPartsMstList(today),
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                color: Color.fromARGB(255, 119, 180, 255),
                height: 250,
                width: double.infinity,
                child: Text("本日：$todayStr"),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    children: List.generate(dataSnapshot.data!.length, (index) {
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            border: Border.all(width: 1.0, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dataSnapshot.data![index].partsName,
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "前回：${dataSnapshot.data![index].lastTrainingDate ?? "-"}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () => GoRouter.of(context).push('/tselect', extra: {'parts': dataSnapshot.data![index], 'date': todayStr}),
                      );
                    }),
                  ),
                ),
              ),
            ],
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

class HistoryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ja_JP',
      firstDay: DateTime.utc(2023, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: DateTime.now(),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
    );
  }
}

class SettingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SettingSelectWidget();
  }
}

class _SettingSelectWidget extends ConsumerWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('部位名'),
              content: Form(
                key: formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '必須です';
                    }
                    return null;
                  },
                ),
              ),
              actions: [
                TextButton(
                  child: Text("キャンセル"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: Text("追加"),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            );
          },
        );
      },
      child: Text('setting'),
    );
  }
}
