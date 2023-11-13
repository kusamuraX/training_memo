import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: _MainBody(),
    );
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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          child: const Text("腕"),
        )
      ],
    );
  }
}
