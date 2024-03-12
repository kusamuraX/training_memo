import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/history_page.dart';
import 'package:training_memo/app/provider/main_page_data.dart';
import 'package:training_memo/app/provider/tab_index.dart';
import 'package:training_memo/app/settings_page.dart';

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
        onTap: (value) async {
          ref.read(tabIndexProvider.notifier).setIndex(value);
        },
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
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      bottomOpacity: 0.0,
      elevation: 0.0,
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
    final today = DateUtils.dateOnly(DateTime.now());
    final db = ref.watch(appDataBaseProvider);
    final mainPageDataAsyncValue = ref.watch(mainPageDataProvider.call(db, today));
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          color: Theme.of(context).primaryColor,
          height: 280,
          width: double.infinity,
          child: mainPageDataAsyncValue.when(
            data: (data) {
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "今週の総挙上重量：${data.weekWeightList[0].totalWeight()} t",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "先週の総挙上重量：${data.weekWeightList[1].totalWeight()} t",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: BarChart(
                    BarChartData(
                      maxY: data.maxScale,
                      titlesData: titlesData,
                      borderData: FlBorderData(show: false),
                      gridData: const FlGridData(show: true),
                      alignment: BarChartAlignment.spaceAround,
                      barGroups: List.generate(
                        bodyPartsList.length,
                        (index) {
                          return BarChartGroupData(
                            x: index,
                            barRods: [
                              BarChartRodData(toY: data.weekWeightList[1].valueOfindex(index), color: Colors.blue),
                              BarChartRodData(toY: data.weekWeightList[0].valueOfindex(index), color: Colors.cyanAccent, width: 14),
                            ],
                            showingTooltipIndicators: [1],
                          );
                        },
                      ),
                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.transparent,
                          tooltipPadding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                          tooltipMargin: 2,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            return BarTooltipItem(
                              '${rod.toY.toString()} t',
                              const TextStyle(fontSize: 12),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ]);
            },
            error: (error, stackTrace) => Text('Error: $error'),
            loading: () => Text(
              "今週の総重量：0 kg",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(4),
            child: mainPageDataAsyncValue.when(
              data: (mainPageData) {
                return GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  children: List.generate(
                    mainPageData.bodyPartsList.length,
                    (index) {
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            border: Border.all(width: 1.0, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  mainPageData.bodyPartsList[index].partsName,
                                  style: TextStyle(
                                    fontSize: 32,
                                  ),
                                ),
                                Text(
                                  "前回：${mainPageData.bodyPartsList[index].lastTrainingDate ?? "-"}",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () => GoRouter.of(context).push('/tselect', extra: {'parts': mainPageData.bodyPartsList[index], 'date': today}),
                      );
                    },
                  ),
                );
              },
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Text('Error: $error'),
            ),
          ),
        ),
      ],
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = bodyPartsList[value.toInt()];
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }
}
