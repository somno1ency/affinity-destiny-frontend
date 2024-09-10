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
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Text(
        title,
        style: Theme.of(context)
            .primaryTextTheme
            .titleSmall!
            .copyWith(color: Colors.white),
      ),
      leading: IconButton(
        icon: const Icon(
          EvaIcons.arrowBack,
          color: Colors.white,
          size: 24,
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
