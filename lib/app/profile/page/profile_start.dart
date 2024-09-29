import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/app/profile/controller/profile_start.dart';
import 'package:affinity_destiny/app/shared/controller/shared.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/component/shared/app_bottom_bar.dart';
import 'package:affinity_destiny/shared/constant.dart';

class ProfileStartPage extends GetView<ProfileStartController> {
  const ProfileStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> actionItems = [];
    for (var menu in controller.menuItems) {
      actionItems.add(
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
        title: controller.title,
        actions: const [],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildProfile(context),
                  const SizedBox(height: 7),
                  ...actionItems,
                ],
              ),
            ),
          ),
          AppBottomBar(
            currentIndex: controller.index,
            callback: SharedController.to.navigateTo,
            menus: SharedController.to.navigationMenus,
          ),
        ],
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    double trailingWidth = Get.width * 0.3;
    return Container(
      alignment: Alignment.center,
      color: AppConstant.colorWhite,
      height: 140,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage:
                  AssetImage(SharedController.to.currentUser.avatar),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  SharedController.to.currentUser.nickname,
                  style: AppConstant.textThemePrimary.titleMedium!
                      .copyWith(color: AppConstant.colorMain),
                ),
                const SizedBox(height: 10),
                Text(
                  '${LangKey.meId.tr}: ${SharedController.to.currentUser.customId}',
                  style: AppConstant.textThemePrimary.labelMedium!
                      .copyWith(color: AppConstant.colorMain),
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
                color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
              ),
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
