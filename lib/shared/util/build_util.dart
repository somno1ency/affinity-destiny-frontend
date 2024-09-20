import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../constant.dart';
import '../../model/orm/user.dart';

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
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorTheme.withOpacity(opacity4),
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: colorTheme.withOpacity(opacity4)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      EvaIcons.imageOutline,
                      size: 30,
                      color: colorTheme,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.chatMenu_photo,
                    style: textThemePrimary.labelSmall!
                        .copyWith(color: colorTheme),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: colorTheme.withOpacity(opacity4)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      EvaIcons.cameraOutline,
                      size: 30,
                      color: colorTheme,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.chatMenu_takePhoto,
                    style: textThemePrimary.labelSmall!
                        .copyWith(color: colorTheme),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: colorTheme.withOpacity(opacity4)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      EvaIcons.videoOutline,
                      size: 30,
                      color: colorTheme,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.chatMenu_video,
                    style: textThemePrimary.labelSmall!
                        .copyWith(color: colorTheme),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: colorTheme.withOpacity(opacity4)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      EvaIcons.phoneCallOutline,
                      size: 30,
                      color: colorTheme,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.chatMenu_voice,
                    style: textThemePrimary.labelSmall!
                        .copyWith(color: colorTheme),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: colorTheme.withOpacity(opacity4)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      EvaIcons.folderOutline,
                      size: 30,
                      color: colorTheme,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.chatMenu_file,
                    style: textThemePrimary.labelSmall!
                        .copyWith(color: colorTheme),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: colorTheme.withOpacity(opacity4)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      EvaIcons.pinOutline,
                      size: 30,
                      color: colorTheme,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.chatMenu_location,
                    style: textThemePrimary.labelSmall!
                        .copyWith(color: colorTheme),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: colorTheme.withOpacity(opacity4)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      EvaIcons.archiveOutline,
                      size: 30,
                      color: colorTheme,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.chatMenu_redPacket,
                    style: textThemePrimary.labelSmall!
                        .copyWith(color: colorTheme),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: colorTheme.withOpacity(opacity4)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      EvaIcons.personOutline,
                      size: 30,
                      color: colorTheme,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.chatMenu_card,
                    style: textThemePrimary.labelSmall!
                        .copyWith(color: colorTheme),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ],
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
