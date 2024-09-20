import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';

import '../../component/chat/app_chat_bar.dart';
import '../../model/component/menu_item.dart';
import '../../shared/constant.dart';

class SetBackgroundWayPage extends StatelessWidget {
  const SetBackgroundWayPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = [
      MenuItem(
        title: AppLocalizations.of(context)!.chat_chooseBackground,
        backgroundColor: colorWhite,
        callback: () {
          Navigator.of(context).pushNamed(routerChooseBackground);
        },
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        showDivider: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.chat_chooseFromPhone,
        backgroundColor: colorWhite,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.chat_chooseFromCamera,
        backgroundColor: colorWhite,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
      ),
    ];
    List<Widget> actionItems = [];
    for (var menu in menuItems) {
      actionItems.add(
        Column(
          children: [
            ListTile(
              title: Text(
                menu.title,
                style: textThemePrimary.labelMedium!.copyWith(color: colorMain),
              ),
              tileColor: menu.backgroundColor,
              trailing: menu.trailing,
              onTap: menu.callback,
            ),
            if (menu.showBottomBorder)
              Divider(
                height: 1,
                color: colorGrey.withOpacity(opacity1),
              ),
            if (menu.showDivider) const SizedBox(height: 7),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppChatBar(
        title: AppLocalizations.of(context)!.chat_backgroundTitle,
        leading: IconButton(
          icon: const Icon(
            Ionicons.arrow_undo_outline,
            size: 24,
          ),
          color: colorWhite,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: const [],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...actionItems,
        ],
      ),
    );
  }
}
