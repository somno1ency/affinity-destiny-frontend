import 'package:flutter/material.dart';

import 'package:affinity_destiny/shared/constant.dart';

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
        style: AppConstant.textThemePrimary.titleSmall!
            .copyWith(color: AppConstant.colorWhite),
      );
    } else {
      customTitle = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppConstant.textThemePrimary.titleSmall!
                .copyWith(color: AppConstant.colorWhite),
          ),
          const SizedBox(width: 8),
          Icon(
            icon,
            color: AppConstant.colorWhite,
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
      backgroundColor: AppConstant.colorTheme,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
