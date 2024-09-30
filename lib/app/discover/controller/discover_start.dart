import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/model/component/menu_item.dart';
import 'package:affinity_destiny/shared/constant.dart';

class DiscoverStartController extends GetxController {
  final int index = 3;
  final String title = LangKey.navMenuDiscoveryBlanked.tr;

  double get trailingWidth => Get.width * 0.4;
  List<MenuItem> get menuItems => [
        MenuItem(
          title: LangKey.discoverFriendMoment.tr,
          callback: () {},
          icon: Ionicons.aperture_outline,
          trailing: SizedBox(
            width: trailingWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  EvaIcons.chevronRightOutline,
                  size: 30,
                  color:
                      AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
                ),
              ],
            ),
          ),
          backgroundColor: AppConstant.colorWhite,
          showDivider: true,
        ),
        MenuItem(
          title: LangKey.discoverCustomMoment.tr,
          callback: () {},
          icon: Ionicons.fitness_outline,
          trailing: SizedBox(
            width: trailingWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  EvaIcons.chevronRightOutline,
                  size: 30,
                  color:
                      AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
                ),
              ],
            ),
          ),
          backgroundColor: AppConstant.colorWhite,
          showDivider: true,
        ),
        MenuItem(
          title: LangKey.discoverRelationship.tr,
          callback: () {},
          icon: Ionicons.people_outline,
          trailing: SizedBox(
            width: trailingWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  EvaIcons.chevronRightOutline,
                  size: 30,
                  color:
                      AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
                ),
              ],
            ),
          ),
          backgroundColor: AppConstant.colorWhite,
          showDivider: true,
        ),
        MenuItem(
          title: LangKey.discoverShare.tr,
          callback: () {},
          icon: Ionicons.share_social_outline,
          trailing: SizedBox(
            width: trailingWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  EvaIcons.chevronRightOutline,
                  size: 30,
                  color:
                      AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
                ),
              ],
            ),
          ),
          backgroundColor: AppConstant.colorWhite,
          showBottomBorder: true,
        ),
        MenuItem(
          title: LangKey.discoverKeyFeature.tr,
          callback: () {},
          icon: Ionicons.star_outline,
          trailing: SizedBox(
            width: trailingWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  EvaIcons.chevronRightOutline,
                  size: 30,
                  color:
                      AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
                ),
              ],
            ),
          ),
          backgroundColor: AppConstant.colorWhite,
        ),
      ];
}
