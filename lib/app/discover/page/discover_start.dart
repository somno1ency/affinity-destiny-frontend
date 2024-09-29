import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:affinity_destiny/app/discover/controller/discover_start.dart';
import 'package:affinity_destiny/app/shared/controller/shared.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/component/shared/app_bottom_bar.dart';
import 'package:affinity_destiny/shared/constant.dart';

class DiscoverStartPage extends GetView<DiscoverStartController> {
  const DiscoverStartPage({super.key});

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
                children: [...actionItems],
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
}
