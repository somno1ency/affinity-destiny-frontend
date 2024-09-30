import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/model/component/menu_item.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

class SetBackgroundWayPage extends StatelessWidget {
  const SetBackgroundWayPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = [
      MenuItem(
        title: LangKey.chatChooseBackground.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {
          Get.toNamed(AppRouter.chooseBackground);
        },
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        showDivider: true,
      ),
      MenuItem(
        title: LangKey.chatChooseFromPhone.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.chatChooseFromCamera.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {},
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
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
        title: LangKey.chatBackgroundTitle.tr,
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
