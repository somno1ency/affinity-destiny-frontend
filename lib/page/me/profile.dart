import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';

import '../../component/chat/app_chat_bar.dart';
import '../../model/component/menu_item.dart';
import '../../model/orm/user.dart';
import '../../shared/constant.dart';

class ProfilePage extends StatelessWidget {
  final String title;

  // TODO: here need the current user info, but transferred from the parent page is not suitable
  // actually, here need a kind of data which can be used globally, load current user info when after login

  const ProfilePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = [
      MenuItem(
        title: AppLocalizations.of(context)!.me_sticker,
        callback: () {},
        icon: Ionicons.happy_outline,
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        backgroundColor: colorWhite,
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.me_setting,
        callback: () {
          Navigator.of(context).pushNamed(routerSetting);
        },
        icon: Ionicons.settings_outline,
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        backgroundColor: colorWhite,
      ),
    ];
    List<Widget> actionItems = [];
    for (var menu in menuItems) {
      actionItems.add(
        Column(
          children: [
            ListTile(
              leading: menu.icon != null ? Icon(menu.icon) : null,
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
        title: title,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfile(context),
            const SizedBox(height: 7),
            ...actionItems,
          ],
        ),
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    double trailingWidth = MediaQuery.of(context).size.width * 0.3;
    User user = const User(
      id: 1,
      mobile: '199199111',
      avatar: 'assets/images/avatar/avatar_001.webp',
      customId: "adfskdf",
      sex: 1,
      nickname: '叶落无痕',
    );

    return Container(
      alignment: Alignment.center,
      color: colorWhite,
      height: 140,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(user.avatar),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.nickname,
                  style:
                      textThemePrimary.titleMedium!.copyWith(color: colorMain),
                ),
                const SizedBox(height: 10),
                Text(
                  '${AppLocalizations.of(context)!.me_id}: ${user.customId}',
                  style:
                      textThemePrimary.labelMedium!.copyWith(color: colorMain),
                ),
              ],
            ),
          ],
        ),
        trailing: SizedBox(
          width: trailingWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Ionicons.qr_code_outline,
                size: 20,
                color: colorGrey.withOpacity(opacity7),
              ),
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: colorGrey.withOpacity(opacity7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
