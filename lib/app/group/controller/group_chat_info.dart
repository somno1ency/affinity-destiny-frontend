import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/model/router/group_chat_start.dart';
import 'package:affinity_destiny/model/component/menu_item.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

class GroupChatInfoController extends GetxController {
  late GroupChatStartArgs args;
  final int showCount = 23;

  @override
  void onInit() {
    super.onInit();
    args = Get.arguments as GroupChatStartArgs;
  }

  List<MenuItem> getMenuItems() {
    double trailingWidth = Get.width * 0.6;
    return [
      MenuItem(
        title: LangKey.groupGroupName.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {
          Get.toNamed(
            AppRouter.groupChatSetName,
            arguments: args.group,
          );
        },
        trailing: SizedBox(
          width: trailingWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                args.group.name,
                style: AppConstant.textThemePrimary.labelMedium!
                    .copyWith(color: AppConstant.colorGrey),
              ),
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
              ),
            ],
          ),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.groupQrCode.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {
          Get.toNamed(
            AppRouter.groupChatQrCode,
            arguments: args.group,
          );
        },
        trailing: SizedBox(
          width: trailingWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Ionicons.qr_code_outline,
                size: 30,
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
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.groupRemark.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {
          Get.toNamed(
            AppRouter.groupChatSetRemark,
            arguments: args.group,
          );
        },
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        showDivider: true,
      ),
      MenuItem(
        title: LangKey.chatSetIsDisturb.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {},
        trailing: Transform.scale(
          scale: 0.7,
          child: Switch(
            value: args.groupContact.isDisturb,
            onChanged: (newValue) {
              // TODO: connect to backend to change value
            },
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
            value: args.groupContact.isTop,
            onChanged: (newValue) {
              // TODO: connect to backend to change value
            },
            activeColor: AppConstant.colorTheme,
            inactiveTrackColor: AppConstant.colorWhite,
          ),
        ),
        showDivider: true,
      ),
      MenuItem(
        title: LangKey.groupMyName.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {
          Get.toNamed(
            AppRouter.groupChatSetNickname,
            arguments: args.groupContact,
          );
        },
        trailing: SizedBox(
          width: trailingWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                args.groupContact.userNickname,
                style: AppConstant.textThemePrimary.labelMedium!
                    .copyWith(color: AppConstant.colorGrey),
              ),
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
              ),
            ],
          ),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.groupShowNickname.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {},
        trailing: Transform.scale(
          scale: 0.7,
          child: Switch(
            value: args.groupContact.isShowNickname,
            onChanged: (newValue) {
              // TODO: connect to backend to change value
            },
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
          Get.toNamed(
            AppRouter.setBackgroundWay,
            // TODO: here the setBackgroundWay page entry params model need to consider different from type
            arguments: args.groupContact,
          );
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
        callback: () {
          // TODO: connect to backend to clean chat
        },
        showDivider: true,
      ),
    ];
  }
}
