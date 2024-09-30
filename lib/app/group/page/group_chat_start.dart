import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/app/group/controller/group_chat_start.dart';
import 'package:affinity_destiny/app/shared/controller/shared.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/component/chat/chat_start_unit.dart';
import 'package:affinity_destiny/component/shared/custom_input.dart';
import 'package:affinity_destiny/component/shared/app_bottom_bar.dart';
import 'package:affinity_destiny/model/component/chat_start_item.dart';
import 'package:affinity_destiny/shared/util/build.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

class GroupChatStartPage extends GetView<GroupChatStartController> {
  const GroupChatStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title: controller.title,
        actions: _buildActions(context),
      ),
      body: _buildBody(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      PopupMenuButton<String>(
        itemBuilder: _buildItem,
        onSelected: (value) {},
        icon: const Icon(EvaIcons.plusCircleOutline),
        iconSize: 24,
        iconColor: AppConstant.colorWhite,
        color: AppConstant.colorWhite,
        position: PopupMenuPosition.under,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      )
    ];
  }

  List<PopupMenuEntry<String>> _buildItem(BuildContext context) {
    return [
      BuildUtil.buildPopupMenuItem(
        Ionicons.chatbubble_ellipses_outline,
        AppConstant.colorTheme,
        LangKey.chatStartGroupChat.tr,
        AppConstant.textThemePrimary.labelMedium!
            .copyWith(color: AppConstant.colorTheme),
        () {},
      ),
      BuildUtil.buildPopupMenuItem(
        Ionicons.person_add,
        AppConstant.colorTheme,
        LangKey.chatAddFriend.tr,
        AppConstant.textThemePrimary.labelMedium!
            .copyWith(color: AppConstant.colorTheme),
        () {},
      ),
    ];
  }

  Widget _buildBody(BuildContext context) {
    var groups = controller.getGroups();
    return Column(
      children: [
        CustomInput(
          color: AppConstant.colorTheme,
          hintText: LangKey.searchPlaceholder.tr,
          hintStyle: AppConstant.textThemePrimary.labelMedium!.copyWith(
              color: AppConstant.colorTheme.withOpacity(AppConstant.opacity5)),
          fontSize: 12,
          isCenter: false,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: groups.length,
            itemBuilder: (context, index) {
              return ChatStartUnit(
                chatStartItem: ChatStartItem(
                  name: groups[index].group.name,
                  avatar: groups[index].group.icon,
                  isDisturb: groups[index].groupContact.isDisturb,
                  lastMsg: groups[index].extra.lastMsg,
                  lastMsgTime: groups[index].extra.lastMsgTime,
                  unreadCount: groups[index].extra.unreadCount,
                ),
                callback: () {
                  Get.toNamed(
                    AppRouter.groupChatting,
                    arguments: groups[index],
                  );
                },
              );
            },
          ),
        ),
        AppBottomBar(
          currentIndex: controller.index,
          callback: SharedController.to.navigateTo,
          menus: SharedController.to.navigationMenus,
        ),
      ],
    );
  }
}
