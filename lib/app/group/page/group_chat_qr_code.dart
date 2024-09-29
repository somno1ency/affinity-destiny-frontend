import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/model/orm/group.dart';
import 'package:affinity_destiny/shared/constant.dart';

class GroupChatQrCodePage extends StatelessWidget {
  final Group group;

  const GroupChatQrCodePage({
    super.key,
    required this.group,
  });

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
                const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/images/avatar/avatar_001.webp'),
                ),
                const SizedBox(height: 10),
                Text(
                  '${LangKey.navMenuGroupChat.tr}: ${group.name}',
                  style: AppConstant.textThemePrimary.bodySmall!.copyWith(
                    color: AppConstant.colorSub1,
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
                Text(
                  LangKey.groupModifyQrCodeTips.trParams({'date': '9月27日前'}),
                  style: AppConstant.textThemePrimary.labelMedium!.copyWith(
                    color:
                        AppConstant.colorSub1.withOpacity(AppConstant.opacity6),
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
