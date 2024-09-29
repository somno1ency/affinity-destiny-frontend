import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/model/component/menu_item.dart';
import 'package:affinity_destiny/model/router/chat_start.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

class ChatInfoController extends GetxController {
  late ChatStartArgs args;

  @override
  void onInit() {
    super.onInit();
    args = Get.arguments as ChatStartArgs;
  }

  List<MenuItem> getMenuItems() {
    return [
      MenuItem(
        title: LangKey.chatSetIsDisturb.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {},
        trailing: Transform.scale(
          scale: 0.7,
          child: Switch(
            value: args.userContact.isDisturb,
            onChanged: (newValue) {},
            activeColor: AppConstant.colorTheme,
            inactiveTrackColor: AppConstant.colorWhite,
          ),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.chatSetIsTop.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {},
        trailing: Transform.scale(
          scale: 0.7,
          child: Switch(
            value: args.userContact.isTop,
            onChanged: (newValue) {},
            activeColor: AppConstant.colorTheme,
            inactiveTrackColor: AppConstant.colorWhite,
          ),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.chatSetIsRemind.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {},
        trailing: Transform.scale(
          scale: 0.7,
          child: Switch(
            value: args.userContact.isRemind,
            onChanged: (newValue) {},
            activeColor: AppConstant.colorTheme,
            inactiveTrackColor: AppConstant.colorWhite,
          ),
        ),
        showDivider: true,
      ),
      MenuItem(
        title: LangKey.chatSetBackground.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {
          Get.toNamed(AppRouter.setBackgroundWay);
        },
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        showDivider: true,
      ),
      MenuItem(
        title: LangKey.chatSetClean.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {},
      ),
    ];
  }
}
