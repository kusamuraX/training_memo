import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_memo/app/constant.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/history_page.dart';
import 'package:training_memo/app/provider/main_page_data.dart';
import 'package:training_memo/app/provider/tab_index.dart';
import 'package:training_memo/app/settings_page.dart';
import 'package:training_memo/app/vmodel/main_page_model.dart';

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
            label: 'Main',
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            child: mainPageDataAsyncValue.when(
              data: (data) {
                // 先週比の計算
                final thisWeekTotal = data.weekWeightList[0].totalWeight();
                final lastWeekTotal = data.weekWeightList[1].totalWeight();
                final weeklyChangePercent = lastWeekTotal > 0 ? ((thisWeekTotal - lastWeekTotal) / lastWeekTotal * 100) : 0.0;

                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 今週の総負荷重量と先週比
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        padding: EdgeInsets.all(8),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(text: "今週の総負荷重量：$thisWeekTotal t "),
                              TextSpan(
                                text: "(先週比：${weeklyChangePercent >= 0 ? '+' : ''}${weeklyChangePercent.toStringAsFixed(1)}%)",
                                style: TextStyle(
                                  color: weeklyChangePercent >= 0 ? Colors.green : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // 当日の各部位の総負荷重量
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "本日(${today.toString().split(' ')[0]})の総負荷重量：${data.todayData.totalWeight()} t",
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            GridView.count(
                              crossAxisCount: 3,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              childAspectRatio: 4,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              children: [
                                _buildTodayPartsWeightItem("胸", data.todayData.chestTotalWeight, 0),
                                _buildTodayPartsWeightItem("背中", data.todayData.backTotalWeight, 1),
                                _buildTodayPartsWeightItem("肩", data.todayData.shoulderTotalWeight, 2),
                                _buildTodayPartsWeightItem("腕", data.todayData.armTotalWeight, 3),
                                _buildTodayPartsWeightItem("腹", data.todayData.absTotalWeight, 4),
                                _buildTodayPartsWeightItem("脚", data.todayData.legTotalWeight, 5),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 32),

                      // 過去8週の部位別総負荷重量グラフ
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 8),
                            child: Text(
                              "過去8週間の部位別総負荷重量推移",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 250,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 18, top: 12, bottom: 8),
                              child: _buildSimpleLineChart(data.past8WeeksData),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () => Text(
                "データを読み込み中...",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          height: 250,
          padding: EdgeInsets.all(4),
          child: mainPageDataAsyncValue.when(
            data: (mainPageData) {
              return Center(
                child: GridView.builder(
                  itemCount: mainPageData.bodyPartsList.length,
                  itemBuilder: (context, index) {
                    return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        side: BorderSide(width: 1, color: PartsColors.getColor(mainPageData.bodyPartsList[index].partsId)),
                      ),
                      onPressed: () async {
                        // トレーニング選択ページに遷移
                        await GoRouter.of(context).push('/tselect', extra: {'parts': mainPageData.bodyPartsList[index], 'date': today});

                        // 戻ってきた時にメインページのデータを更新
                        final db = ref.read(appDataBaseProvider);
                        ref.invalidate(mainPageDataProvider.call(db, today));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            mainPageData.bodyPartsList[index].partsName,
                            style: TextStyle(
                              fontSize: 24,
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
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                ),
              );
            },
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
        ),
      ],
    );
  }

  Widget _buildTodayPartsWeightItem(String partsName, double weight, int partsId) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: PartsColors.getColor(partsId),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(width: 8),
          Text(
            "$partsName : $weight t",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  double _getMaxYValue(List<PartsWeight> data) {
    double maxValue = 0;
    for (var weekData in data) {
      final values = [
        weekData.chestTotalWeight,
        weekData.backTotalWeight,
        weekData.shoulderTotalWeight,
        weekData.armTotalWeight,
        weekData.absTotalWeight,
        weekData.legTotalWeight,
      ];
      final weekMax = values.reduce((a, b) => a > b ? a : b);
      if (weekMax > maxValue) maxValue = weekMax;
    }
    if (maxValue <= 0) return 10.0;

    final adjustedMax = maxValue * 1.2;
    final magnitude = (adjustedMax / 10).ceil() * 10;
    return magnitude.toDouble();
  }

  Widget _buildSimpleLineChart(List<PartsWeight> data) {
    if (data.isEmpty) {
      return Center(
        child: Text(
          'データがありません',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      );
    }

    final List<Color> colors = [
      PartsColors.getColor(0),
      PartsColors.getColor(1),
      PartsColors.getColor(2),
      PartsColors.getColor(3),
      PartsColors.getColor(4),
      PartsColors.getColor(5),
    ];

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 2,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.white24,
              strokeWidth: 0.5,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 20,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                const style = TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                );
                String text = '';
                switch (value.toInt()) {
                  case 0:
                    text = '7週前';
                    break;
                  case 1:
                    text = '6週前';
                    break;
                  case 2:
                    text = '5週前';
                    break;
                  case 3:
                    text = '4週前';
                    break;
                  case 4:
                    text = '3週前';
                    break;
                  case 5:
                    text = '2週前';
                    break;
                  case 6:
                    text = '先週';
                    break;
                  case 7:
                    text = '今週';
                    break;
                }
                return SideTitleWidget(
                  meta: meta,
                  space: 5,
                  child: Text(text, style: style),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 10,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  '${value.toInt()}t',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                );
              },
              reservedSize: 25,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 7,
        minY: 0,
        maxY: _getMaxYValue(data),
        lineBarsData: _buildLineChartBars(data, colors),
      ),
    );
  }

  List<LineChartBarData> _buildLineChartBars(List<PartsWeight> data, List<Color> colors) {
    List<LineChartBarData> lines = [];

    for (int partIndex = 0; partIndex < 6; partIndex++) {
      List<FlSpot> spots = [];
      for (int weekIndex = 0; weekIndex < data.length; weekIndex++) {
        double value = data[weekIndex].valueOfindex(partIndex);
        spots.add(FlSpot(weekIndex.toDouble(), value));
      }

      lines.add(
        LineChartBarData(
          spots: spots,
          isCurved: false,
          color: colors[partIndex],
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 3,
                color: colors[partIndex],
                strokeWidth: 1,
                strokeColor: Colors.white,
              );
            },
          ),
          belowBarData: BarAreaData(show: false),
        ),
      );
    }

    return lines;
  }
}
