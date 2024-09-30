import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'package:affinity_destiny/lang/translation_service.dart';
import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/model/orm/resource_item.dart';
import 'package:affinity_destiny/shared/constant.dart';

class ChooseBackgroundPage extends StatelessWidget {
  const ChooseBackgroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    Locale locale =
        TranslationService.locale ?? TranslationService.fallbackLocale;
    List<ResourceItem> backgroundItems = [];
    for (int i = 0; i < 10; i++) {
      backgroundItems.add(
        ResourceItem(
          id: i + 1,
          src: 'assets/images/background.png',
          nameZh: '背景$i',
          nameEn: 'Background$i',
          type: 1,
        ),
      );
    }
    List<Widget> backgrounds = [];
    for (var background in backgroundItems) {
      backgrounds.add(
        Column(
          children: [
            GestureDetector(
              onTap: () {
                print(background.id);
              },
              child: Container(
                width: 110,
                height: 110,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(background.src),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              locale.languageCode == 'en'
                  ? background.nameEn
                  : background.nameZh,
              style: AppConstant.textThemePrimary.labelMedium!
                  .copyWith(color: AppConstant.colorMain),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppChatBar(
        title: LangKey.chatChooseBackground.tr,
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
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                side: const BorderSide(color: AppConstant.colorWhite),
                backgroundColor: AppConstant.colorTransparent,
                minimumSize: const Size(60, 33),
              ),
              child: Text(
                LangKey.systemOk.tr,
                style: AppConstant.textThemePrimary.labelMedium!
                    .copyWith(color: AppConstant.colorWhite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Wrap(
              spacing: -20,
              runSpacing: 10,
              children: [
                ...backgrounds,
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
