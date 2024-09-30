import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/app/group/controller/group_chat_setting_processor.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/shared/constant.dart';

class GroupChatQrCodePage extends GetView<GroupChatSettingProcessorController> {
  const GroupChatQrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title: LangKey.groupQrCode.tr,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(controller.args.group.icon),
                ),
                const SizedBox(height: 10),
                Text(
                  '${LangKey.navMenuGroupChat.tr}: ${controller.args.group.name}',
                  style: AppConstant.textThemePrimary.bodySmall!.copyWith(
                    color: AppConstant.colorMain,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 220,
                  width: 220,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/qrcode.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: Get.width * 0.7,
                  child: Text(
                    LangKey.groupModifyQrCodeTips.trParams({'date': '9月27日前'}),
                    textAlign: TextAlign.center,
                    style: AppConstant.textThemePrimary.labelMedium!.copyWith(
                      color: AppConstant.colorSub1
                          .withOpacity(AppConstant.opacity6),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
              LangKey.systemSavePicture.tr,
              style: AppConstant.textThemePrimary.labelMedium!
                  .copyWith(color: AppConstant.colorTheme),
            ),
          ),
        ],
      ),
    );
  }
}
