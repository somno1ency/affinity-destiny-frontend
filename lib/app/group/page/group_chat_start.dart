import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:english_words/english_words.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/component/shared/custom_input.dart';
import 'package:affinity_destiny/component/chat/chat_start_unit.dart';
import 'package:affinity_destiny/model/orm/group.dart';
import 'package:affinity_destiny/model/router/group.dart';
import 'package:affinity_destiny/app/group/controller/group_chat_start.dart';
import 'package:affinity_destiny/component/shared/app_bottom_bar.dart';
import 'package:affinity_destiny/app/shared/controller/shared.dart';
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
    var chatListItems = controller.getChatListItems();
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
            itemCount: chatListItems.length,
            itemBuilder: (context, index) {
              int identity = (index % 3) + 1;
              return ChatStartUnit(
                chatStartItem: chatListItems[index],
                callback: () {
                  Group targetGroup = Group(
                    id: index,
                    ownerId: 1,
                    groupId: 'xxx',
                    name: chatListItems[index].name,
                    category: 1,
                    // not need to display the icon in chat detail, so this field is not used
                    icon: identity > 0
                        ? 'assets/images/avatar/avatar_00$identity.webp'
                        : '',
                    memo: WordPair.random().asSnakeCase,
                  );
                  Navigator.of(context).pushNamed(
                    AppRouter.groupChatting,
                    arguments: GroupArgs(
                      currentUser: SharedController.to.currentUser,
                      targetGroup: targetGroup,
                    ),
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
