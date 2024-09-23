import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../model/component/chat_bottom_menu_item.dart';
import '../../model/orm/user.dart';
import '../constant.dart';

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
        name: AppLocalizations.of(context)!.chatMenu_photo,
        callback: () {
          print(1111);
        },
        icon: EvaIcons.imageOutline,
      ),
      ChatBottomMenuItem(
        name: AppLocalizations.of(context)!.chatMenu_takePhoto,
        callback: () {},
        icon: EvaIcons.cameraOutline,
      ),
      ChatBottomMenuItem(
        name: AppLocalizations.of(context)!.chatMenu_video,
        callback: () {},
        icon: EvaIcons.videoOutline,
      ),
      ChatBottomMenuItem(
        name: AppLocalizations.of(context)!.chatMenu_voice,
        callback: () {},
        icon: EvaIcons.phoneCallOutline,
      ),
    ];
    List<ChatBottomMenuItem> secondRowItems = [
      ChatBottomMenuItem(
        name: AppLocalizations.of(context)!.chatMenu_file,
        callback: () {},
        icon: EvaIcons.folderOutline,
      ),
      ChatBottomMenuItem(
        name: AppLocalizations.of(context)!.chatMenu_location,
        callback: () {},
        icon: EvaIcons.pinOutline,
      ),
      ChatBottomMenuItem(
        name: AppLocalizations.of(context)!.chatMenu_redPacket,
        callback: () {},
        icon: EvaIcons.archiveOutline,
      ),
      ChatBottomMenuItem(
        name: AppLocalizations.of(context)!.chatMenu_card,
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
                  border: Border.all(color: colorGrey.withOpacity(opacity4)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  item.icon,
                  size: 30,
                  color: colorSub1,
                ),
              ),
              Text(
                item.name,
                style: textThemePrimary.labelSmall!.copyWith(color: colorSub1),
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
                  border: Border.all(color: colorGrey.withOpacity(opacity4)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  item.icon,
                  size: 30,
                  color: colorSub1,
                ),
              ),
              Text(
                item.name,
                style: textThemePrimary.labelSmall!.copyWith(color: colorSub1),
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
            color: colorTheme.withOpacity(opacity3),
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
        color: colorWhite,
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
                      color: colorSub2.withOpacity(opacity3),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        users[i].nickname[0],
                        style: textThemePrimary.bodyMedium!
                            .copyWith(color: colorTheme.withOpacity(opacity5)),
                      ),
                    ),
                  ),
            Text(
              users[i].nickname,
              style: textThemePrimary.labelSmall!.copyWith(color: colorSub2),
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
        color: colorWhite,
        border: Border.all(
          color: colorSub1.withOpacity(opacity6),
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Icon(
        EvaIcons.plus,
        size: 30,
        color: colorSub1,
      ),
    );
    photos.add(lastItem);

    return Container(
      width: double.infinity,
      color: colorWhite,
      padding: const EdgeInsets.only(bottom: 10),
      child: Wrap(
        spacing: -15,
        runSpacing: 5,
        children: [...photos],
      ),
    );
  }
}
