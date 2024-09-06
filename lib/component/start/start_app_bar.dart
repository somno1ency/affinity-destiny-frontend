import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class StartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback callback;

  const StartAppBar({
    super.key,
    required this.title,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      leading: IconButton(
        icon: const Icon(
          EvaIcons.arrowBack,
          color: Colors.white,
        ),
        onPressed: callback,
      ),
      centerTitle: false,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
