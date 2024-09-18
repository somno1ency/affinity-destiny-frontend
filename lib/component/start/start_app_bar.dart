import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../shared/constant.dart';

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
        style: textThemePrimary.titleSmall!.copyWith(color: colorWhite),
      ),
      leading: IconButton(
        icon: const Icon(
          EvaIcons.arrowBack,
          color: colorWhite,
          size: 24,
        ),
        onPressed: callback,
      ),
      centerTitle: false,
      backgroundColor: colorTheme,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
