import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({super.key});

  @override
  Widget build(Object context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.redAccent,
      title: _title(),
    );
  }

  Widget _title() => const Text('I WILL LOVE YOU FOREVER');

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
