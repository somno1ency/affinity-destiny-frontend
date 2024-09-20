import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';

import '../../component/chat/app_chat_bar.dart';
import '../../model/orm/resource_item.dart';
import '../../shared/constant.dart';

class ChooseBackgroundPage extends StatelessWidget {
  const ChooseBackgroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    String localeName = AppLocalizations.of(context)!.localeName;
    List<ResourceItem> backgroundItems = [];
    for (int i = 0; i < 10; i++) {
      backgroundItems.add(
        ResourceItem(
          id: i + 1,
          src: 'assets/images/background.png',
          nameZh: '背景$i',
          nameEn: 'Background$i',
          category: 1,
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
              localeName == 'en' ? background.nameEn : background.nameZh,
              style: textThemePrimary.labelMedium!.copyWith(color: colorMain),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppChatBar(
        title: AppLocalizations.of(context)!.chat_chooseBackground,
        leading: IconButton(
          icon: const Icon(
            Ionicons.arrow_undo_outline,
            size: 24,
          ),
          color: colorWhite,
          onPressed: () {
            Navigator.of(context).pop();
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
                side: const BorderSide(color: colorWhite),
                backgroundColor: colorTransparent,
                minimumSize: const Size(60, 33),
              ),
              child: Text(
                AppLocalizations.of(context)!.system_ok,
                style:
                    textThemePrimary.labelMedium!.copyWith(color: colorWhite),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Wrap(
            spacing: -20,
            runSpacing: 10,
            children: [
              ...backgrounds,
            ],
          ),
        ],
      ),
    );
  }
}
