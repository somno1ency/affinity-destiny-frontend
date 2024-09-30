import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/app/group/controller/group_chat_info.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/shared/util/build.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

class GroupChatInfoPage extends GetView<GroupChatInfoController> {
  const GroupChatInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> actionItems = [];
    var menuItems = controller.getMenuItems();
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
        title:
            '${controller.args.group.name} (${controller.args.users.length})',
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 10,
              color: AppConstant.colorWhite,
            ),
            BuildUtil.buildPhotoGallery(
                controller.args.users, controller.showCount),
            if (controller.args.users.length > controller.showCount)
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    AppRouter.groupChatMemberInfo,
                    arguments: controller.args,
                  );
                },
                child: Container(
                  height: 30,
                  width: double.infinity,
                  color: AppConstant.colorWhite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LangKey.groupAllMember.tr,
                        textAlign: TextAlign.center,
                        style: AppConstant.textThemePrimary.labelMedium!
                            .copyWith(color: AppConstant.colorMain),
                      ),
                      Icon(
                        EvaIcons.chevronRightOutline,
                        size: 30,
                        color: AppConstant.colorGrey
                            .withOpacity(AppConstant.opacity7),
                      )
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 7),
            ...actionItems,
            ListTile(
              title: Text(
                LangKey.groupQuit.tr,
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
