import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/model/component/chat_bottom_menu_item.dart';
import 'package:affinity_destiny/model/orm/user.dart';
import 'package:affinity_destiny/shared/constant.dart';

class BuildUtil {
  const BuildUtil._();

  static PopupMenuItem<String> buildPopupMenuItem(
    IconData icon,
    Color color,
    String text,
    TextStyle textStyle,
    VoidCallback callback,
  ) {
    return PopupMenuItem<String>(
      onTap: callback,
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 16,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
    );
  }

  static Widget buildChatBottomMenu(BuildContext context) {
    List<ChatBottomMenuItem> firstRowItems = [
      ChatBottomMenuItem(
        name: LangKey.chatMenuPhoto.tr,
        callback: () {
          print(1111);
        },
        icon: EvaIcons.imageOutline,
      ),
      ChatBottomMenuItem(
        name: LangKey.chatMenuTakePhoto.tr,
        callback: () {},
        icon: EvaIcons.cameraOutline,
      ),
      ChatBottomMenuItem(
        name: LangKey.chatMenuVideo.tr,
        callback: () {},
        icon: EvaIcons.videoOutline,
      ),
      ChatBottomMenuItem(
        name: LangKey.chatMenuVoice.tr,
        callback: () {},
        icon: EvaIcons.phoneCallOutline,
      ),
    ];
    List<ChatBottomMenuItem> secondRowItems = [
      ChatBottomMenuItem(
        name: LangKey.chatMenuFile.tr,
        callback: () {},
        icon: EvaIcons.folderOutline,
      ),
      ChatBottomMenuItem(
        name: LangKey.chatMenuLocation.tr,
        callback: () {},
        icon: EvaIcons.pinOutline,
      ),
      ChatBottomMenuItem(
        name: LangKey.chatMenuRedPacket.tr,
        callback: () {},
        icon: EvaIcons.archiveOutline,
      ),
      ChatBottomMenuItem(
        name: LangKey.chatMenuCard.tr,
        callback: () {},
        icon: EvaIcons.personOutline,
      ),
    ];
    List<Widget> firstRowActionItems = [];
    List<Widget> secondRowActionItems = [];
    for (var item in firstRowItems) {
      firstRowActionItems.add(
        GestureDetector(
          onTap: item.callback,
          child: Column(
            children: [
              Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppConstant.colorGrey
                          .withOpacity(AppConstant.opacity4)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  item.icon,
                  size: 30,
                  color: AppConstant.colorSub1,
                ),
              ),
              Text(
                item.name,
                style: AppConstant.textThemePrimary.labelSmall!
                    .copyWith(color: AppConstant.colorSub1),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      );
    }
    for (var item in secondRowItems) {
      secondRowActionItems.add(
        GestureDetector(
          onTap: item.callback,
          child: Column(
            children: [
              Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppConstant.colorGrey
                          .withOpacity(AppConstant.opacity4)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  item.icon,
                  size: 30,
                  color: AppConstant.colorSub1,
                ),
              ),
              Text(
                item.name,
                style: AppConstant.textThemePrimary.labelSmall!
                    .copyWith(color: AppConstant.colorSub1),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppConstant.colorTheme.withOpacity(AppConstant.opacity3),
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [...firstRowActionItems],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [...secondRowActionItems],
          ),
        ],
      ),
    );
  }

  static Widget buildPhotoGallery(List<User> users, int showCount) {
    int length = users.length;
    List<Widget> photos = [];
    for (int i = 0; i < length; i++) {
      if (showCount > 0 && i == showCount) {
        break;
      }

      Widget current = Container(
        color: AppConstant.colorWhite,
        child: Column(
          children: [
            users[i].avatar != ''
                ? Container(
                    height: 50,
                    width: 50,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: AssetImage(
                          users[i].avatar,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    height: 50,
                    width: 50,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppConstant.colorSub2
                          .withOpacity(AppConstant.opacity3),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        users[i].nickname[0],
                        style: AppConstant.textThemePrimary.bodyMedium!
                            .copyWith(
                                color: AppConstant.colorTheme
                                    .withOpacity(AppConstant.opacity5)),
                      ),
                    ),
                  ),
            Text(
              users[i].nickname,
              style: AppConstant.textThemePrimary.labelSmall!
                  .copyWith(color: AppConstant.colorSub2),
            ),
          ],
        ),
      );

      photos.add(current);
    }
    Widget lastItem = Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: AppConstant.colorWhite,
        border: Border.all(
          color: AppConstant.colorSub1.withOpacity(AppConstant.opacity6),
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Icon(
        EvaIcons.plus,
        size: 30,
        color: AppConstant.colorSub1,
      ),
    );
    photos.add(lastItem);

    return Container(
      width: double.infinity,
      color: AppConstant.colorWhite,
      padding: const EdgeInsets.only(bottom: 10),
      child: Wrap(
        spacing: -15,
        runSpacing: 5,
        children: [...photos],
      ),
    );
  }
}
