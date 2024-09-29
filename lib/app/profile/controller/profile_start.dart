import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/model/component/menu_item.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

class ProfileStartController extends GetxController {
  final int index = 4;
  final String title = LangKey.navMenuAccountBlanked.tr;

  List<MenuItem> get menuItems => [
        MenuItem(
          title: LangKey.meSticker.tr,
          callback: () {},
          icon: Ionicons.happy_outline,
          trailing: Icon(
            EvaIcons.chevronRightOutline,
            size: 30,
            color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
          ),
          backgroundColor: AppConstant.colorWhite,
          showBottomBorder: true,
        ),
        MenuItem(
          title: LangKey.meSetting.tr,
          callback: () {
            Get.toNamed(AppRouter.setting);
          },
          icon: Ionicons.settings_outline,
          trailing: Icon(
            EvaIcons.chevronRightOutline,
            size: 30,
            color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
          ),
          backgroundColor: AppConstant.colorWhite,
        ),
      ];
}
