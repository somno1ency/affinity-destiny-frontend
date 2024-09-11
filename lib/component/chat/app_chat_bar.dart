import 'package:flutter/material.dart';

import '../../shared/constant.dart';

class AppChatBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? icon;
  final Widget? leading;
  final List<Widget>? actions;

  const AppChatBar({
    super.key,
    required this.title,
    required this.actions,
    this.icon,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    Widget customTitle;
    if (icon == null) {
      customTitle = Text(
        title,
        style: Theme.of(context)
            .primaryTextTheme
            .titleSmall!
            .copyWith(color: colorWhite),
      );
    } else {
      customTitle = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .primaryTextTheme
                .titleSmall!
                .copyWith(color: colorWhite),
          ),
          const SizedBox(width: 8),
          Icon(
            icon,
            color: colorWhite,
            size: 16,
          ),
        ],
      );
    }

    return AppBar(
      // if not set leading, abandon to automatic generate the left arrow(will display as black arrow)
      automaticallyImplyLeading: false,
      leading: leading,
      title: customTitle,
      actions: actions,
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
