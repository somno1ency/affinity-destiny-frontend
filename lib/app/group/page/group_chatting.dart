import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/app/group/controller/group_chatting.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/component/chat/chat_input_bar.dart';
import 'package:affinity_destiny/shared/util/build.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

class GroupChattingPage extends GetView<GroupChattingController> {
  const GroupChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title: controller.args.group.name,
        icon: controller.bellIcon,
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
        actions: [
          IconButton(
            icon: const Icon(
              EvaIcons.moreHorizontalOutline,
              size: 24,
            ),
            color: AppConstant.colorWhite,
            onPressed: () {
              Get.toNamed(
                AppRouter.groupChatInfo,
                arguments: controller.args,
              );
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: controller.onCloseBottomMenu,
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: ListView(
                  children: controller.state.chattingMsgs,
                ),
              ),
              ChatInputBar(
                controller: TextEditingController(),
                callback: () {
                  controller.onToggleBottomMenu();
                },
              ),
              if (controller.state.isBottomMenuOpen.value)
                BuildUtil.buildChatBottomMenu(context),
            ],
          ),
        ),
      ),
    );
  }
}
