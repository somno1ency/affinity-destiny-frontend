import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/model/component/menu_item.dart';
import 'package:affinity_destiny/shared/constant.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuItem> topHalfItems = [
      MenuItem(
        title: LangKey.settingAccountSecurity.tr,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        backgroundColor: AppConstant.colorWhite,
        showDivider: true,
      ),
      MenuItem(
        title: LangKey.settingNotify.tr,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        backgroundColor: AppConstant.colorWhite,
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.settingGeneral.tr,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        backgroundColor: AppConstant.colorWhite,
      ),
    ];
    List<MenuItem> bottomHalfItems = [
      MenuItem(
        title: LangKey.settingFriendPermission.tr,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        backgroundColor: AppConstant.colorWhite,
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.settingMyPermission.tr,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        backgroundColor: AppConstant.colorWhite,
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.settingPersonalInfo.tr,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        backgroundColor: AppConstant.colorWhite,
        showDivider: true,
      ),
      MenuItem(
        title: LangKey.settingFeedback.tr,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        backgroundColor: AppConstant.colorWhite,
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.settingAbout.tr,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        backgroundColor: AppConstant.colorWhite,
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
                style: AppConstant.textThemePrimary.labelMedium!
                    .copyWith(color: AppConstant.colorMain),
              ),
              tileColor: menu.backgroundColor,
              trailing: menu.trailing,
              onTap: menu.callback,
            ),
            if (menu.showBottomBorder)
              Divider(
                height: 1,
                color: AppConstant.colorGrey.withOpacity(AppConstant.opacity1),
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
                style: AppConstant.textThemePrimary.labelMedium!
                    .copyWith(color: AppConstant.colorMain),
              ),
              tileColor: menu.backgroundColor,
              trailing: menu.trailing,
              onTap: menu.callback,
            ),
            if (menu.showBottomBorder)
              Divider(
                height: 1,
                color: AppConstant.colorGrey.withOpacity(AppConstant.opacity1),
              ),
            if (menu.showDivider) const SizedBox(height: 7),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppChatBar(
        title: LangKey.meSetting.tr,
        leading: IconButton(
          icon: const Icon(
            Ionicons.arrow_undo_outline,
            size: 24,
          ),
          color: AppConstant.colorWhite,
          onPressed: () {
            Get.back();
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
                LangKey.settingPrivacy.tr,
                style: AppConstant.textThemePrimary.labelSmall!.copyWith(
                  color:
                      AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
                ),
              ),
            ),
            ...bottomHalfActionItems,
            ListTile(
              title: Text(
                LangKey.settingSwitch.tr,
                textAlign: TextAlign.center,
                style: AppConstant.textThemePrimary.bodySmall!
                    .copyWith(color: AppConstant.colorRed),
              ),
              tileColor: AppConstant.colorWhite,
              onTap: () {},
            ),
            const SizedBox(height: 7),
            ListTile(
              title: Text(
                LangKey.settingLogout.tr,
                textAlign: TextAlign.center,
                style: AppConstant.textThemePrimary.bodySmall!
                    .copyWith(color: AppConstant.colorRed),
              ),
              tileColor: AppConstant.colorWhite,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
