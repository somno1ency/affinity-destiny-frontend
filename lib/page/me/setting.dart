import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';

import '../../component/chat/app_chat_bar.dart';
import '../../model/component/menu_item.dart';
import '../../model/orm/user.dart';
import '../../shared/constant.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuItem> topHalfItems = [
      MenuItem(
        title: AppLocalizations.of(context)!.setting_accountSecurity,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        backgroundColor: colorWhite,
        showDivider: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.setting_notify,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        backgroundColor: colorWhite,
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.setting_general,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        backgroundColor: colorWhite,
      ),
    ];
    List<MenuItem> bottomHalfItems = [
      MenuItem(
        title: AppLocalizations.of(context)!.setting_friendPermission,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        backgroundColor: colorWhite,
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.setting_myPermission,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        backgroundColor: colorWhite,
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.setting_personalInfo,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        backgroundColor: colorWhite,
        showDivider: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.setting_feedback,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        backgroundColor: colorWhite,
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.setting_about,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        backgroundColor: colorWhite,
        showDivider: true,
      ),
    ];
    List<Widget> topHalfActionItems = [];
    List<Widget> bottomHalfActionItems = [];
    for (var menu in topHalfItems) {
      topHalfActionItems.add(
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
    for (var menu in bottomHalfItems) {
      bottomHalfActionItems.add(
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
        title: AppLocalizations.of(context)!.me_setting,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...topHalfActionItems,
            Container(
              // height: 20,
              padding: const EdgeInsets.fromLTRB(17, 7, 0, 3),
              width: double.infinity,
              child: Text(
                AppLocalizations.of(context)!.setting_privacy,
                style: textThemePrimary.labelSmall!.copyWith(
                  color: colorGrey.withOpacity(opacity7),
                ),
              ),
            ),
            ...bottomHalfActionItems,
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.setting_switch,
                textAlign: TextAlign.center,
                style: textThemePrimary.bodySmall!.copyWith(color: colorRed),
              ),
              tileColor: colorWhite,
              onTap: () {},
            ),
            const SizedBox(height: 7),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.setting_logout,
                textAlign: TextAlign.center,
                style: textThemePrimary.bodySmall!.copyWith(color: colorRed),
              ),
              tileColor: colorWhite,
              onTap: () {},
            ),
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
                const SizedBox(height: 5),
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
