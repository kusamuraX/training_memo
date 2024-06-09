
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/provider/parts_data.dart';

class PartsSelectPage extends StatelessWidget {

  final DateTime date;

  const PartsSelectPage(this.date, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _PartsSelectPageAppBar(date),
      body: _PartsSelect(date),
    );
  }
}

class _PartsSelectPageAppBar extends StatelessWidget implements PreferredSizeWidget {

  final DateTime date;

  const _PartsSelectPageAppBar(this.date);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('部位選択 [ $date ]', style: TextStyle(fontSize: 12),),
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}


class _PartsSelect extends ConsumerWidget {

  final DateTime date;

  _PartsSelect(this.date);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDataBaseProvider);
    final partsDataList = ref.watch(partsDataProvider.call(db));
    return ListView(
      children: partsDataList.when(
        data: (dataList) {
          return List.generate(
            dataList.length,
            (index) => GestureDetector(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                ),
                child: Center(
                  child: Text(
                    dataList[index].partsName,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              onTap: () => GoRouter.of(context).push('/tselect', extra: {'parts': dataList[index], 'date': date}),
            ),
          );
        },
        loading: () => [
          Center(
            child: CircularProgressIndicator(),
          )
        ],
        error: (error, stackTrace) => [Text('Error: $error')],
      ),
    );
  }
}
