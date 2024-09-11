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
      // 没有设置leading时,禁止自动生成左侧箭头,生成的黑色,没有特意定义效果,与主题不搭配,尽量都手动控制
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
