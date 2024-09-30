import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/app/group/controller/group_chat_setting_processor.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/shared/constant.dart';

class GroupChatSetRemarkPage
    extends GetView<GroupChatSettingProcessorController> {
  const GroupChatSetRemarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    double tipsWidth = Get.width * 0.9;
    double mainWidth = Get.width * 0.8;
    double subWidth = Get.width * 0.6;

    return Scaffold(
      appBar: AppChatBar(
        title: LangKey.groupRemark.tr,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: tipsWidth,
                  child: Text(
                    textAlign: TextAlign.center,
                    LangKey.groupModifyRemarkTips.tr,
                    style: AppConstant.textThemePrimary.bodySmall!
                        .copyWith(color: AppConstant.colorMain),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Container(
                    height: 50,
                    width: mainWidth,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppConstant.colorSub1
                              .withOpacity(AppConstant.opacity1),
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: AppConstant.colorSub1
                              .withOpacity(AppConstant.opacity1),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage(controller.args.group.icon),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: subWidth,
                          child: TextField(
                            cursorColor: AppConstant.colorTheme,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: controller.args.group.name,
                              hintStyle: AppConstant
                                  .textThemePrimary.labelMedium!
                                  .copyWith(color: AppConstant.colorSub2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    side: const BorderSide(
                      color: AppConstant.colorTheme,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    LangKey.systemOk.tr,
                    style: AppConstant.textThemePrimary.labelMedium!
                        .copyWith(color: AppConstant.colorTheme),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
