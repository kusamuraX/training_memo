import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:training_memo/app/data/database.dart';
import 'package:training_memo/app/provider/parts_data.dart';
import 'package:training_memo/app/provider/parts_training_data.dart';

class SettingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.settings),
                const Text(
                  'トレーニング編集',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          onTap: () => GoRouter.of(context).push('/setting-parts-select'),
        ),
      ],
    );
  }
}

// 設定部位選択
class SettingPartsSelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _SettingPartsSelectPageAppBar(),
      body: _SettingPartsSelect(),
    );
  }
}

class _SettingPartsSelectPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('編集部位選択'),
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}

class _SettingPartsSelect extends ConsumerWidget {
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
              onTap: () => GoRouter.of(context).push('/edit-training', extra: {'partsInfo': dataList[index]}),
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

// トレーニング設定
class EditTrainingPage extends StatelessWidget {
  final int partsId;
  final String partsName;

  const EditTrainingPage(this.partsId, this.partsName, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _SettingTrainingPageAppBar(partsName),
      body: _SettingTrainingPage(partsId),
    );
  }
}

class _SettingTrainingPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String partsName;

  const _SettingTrainingPageAppBar(this.partsName);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('$partsName種目編集'),
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}

class _SettingTrainingPage extends ConsumerWidget {
  final int partsId;

  _SettingTrainingPage(this.partsId);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    final FormGroup form = FormGroup({
      'menu': FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
    });
    final db = ref.watch(appDataBaseProvider);
    final trainingDataList = ref.watch(partsTrainingDataProvider.call(db, partsId));
    return ListView(
      children: [
        ...trainingDataList.when(
          data: (dataList) {
            return List.generate(
              dataList.length,
              (index) => Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth / 1.5,
                      child: Text(
                        dataList[index].trainingName,
                        style: TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            form.control('menu').value = dataList[index].trainingName;
                            showDialog<void>(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  content: ReactiveForm(
                                    formGroup: form,
                                    child: ReactiveTextField(
                                      decoration: const InputDecoration(labelText: '種目名'),
                                      formControlName: 'menu',
                                      validationMessages: {
                                        ValidationMessage.required: (error) => '種目名を入力してください',
                                      },
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('キャンセル'),
                                      onPressed: () {
                                        form.control('menu').value = '';
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: Text('変更'),
                                      onPressed: () {
                                        if (form.valid) {
                                          ref
                                              .read(partsTrainingDataProvider.call(db, partsId).notifier)
                                              .editMenu(dataList[index].partsTrainingId, form.control('menu').value);
                                          form.control('menu').value = '';
                                          Navigator.pop(context);
                                        }
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () {
                            showDialog<void>(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  content: Text('削除してよろしいでしょうか？'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('キャンセル'),
                                      onPressed: () {
                                        form.control('menu').value = '';
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: Text('削除'),
                                      onPressed: () async {
                                        final result = await ref
                                            .read(partsTrainingDataProvider.call(db, partsId).notifier)
                                            .deleteMenu(dataList[index].partsTrainingId);
                                        if (context.mounted) {
                                          Navigator.pop(context);
                                        }
                                        if (!result && context.mounted) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              duration: const Duration(seconds: 1),
                                              content: const Text('データが存在するため削除できません'),
                                            ),
                                          );
                                        }
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.delete_forever),
                        ),
                      ],
                    ),
                  ],
                ),
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
        Container(
          padding: EdgeInsets.all(12),
          child: IconButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    content: ReactiveForm(
                      formGroup: form,
                      child: ReactiveTextField(
                        decoration: const InputDecoration(labelText: '種目名'),
                        formControlName: 'menu',
                        validationMessages: {
                          ValidationMessage.required: (error) => '種目名を入力してください',
                        },
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('キャンセル'),
                        onPressed: () {
                          form.control('menu').value = '';
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text('追加'),
                        onPressed: () {
                          if (form.valid) {
                            ref.read(partsTrainingDataProvider.call(db, partsId).notifier).addMenu(form.control('menu').value);
                            form.control('menu').value = '';
                            Navigator.pop(context);
                          }
                        },
                      )
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.add_circle_outline),
          ),
        )
      ],
    );
  }
}
