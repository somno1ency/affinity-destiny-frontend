import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../component/chat/app_chat_bar.dart';
import '../../model/component/menu_item.dart';
import '../../model/orm/user.dart';
import '../../model/router/chat_info_args.dart';
import '../../shared/util/build_util.dart';
import '../../shared/constant.dart';

class ChatInfoPage extends StatefulWidget {
  final ChatInfoArgs args;

  const ChatInfoPage({
    super.key,
    required this.args,
  });

  @override
  State<ChatInfoPage> createState() => _ChatInfoPageState();
}

class _ChatInfoPageState extends State<ChatInfoPage> {
  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = [
      MenuItem(
        title: AppLocalizations.of(context)!.chat_setIsDisturb,
        backgroundColor: colorWhite,
        callback: () {},
        trailing: Transform.scale(
          scale: 0.7,
          child: Switch(
            value: true,
            onChanged: (newValue) {},
            activeColor: colorTheme,
            inactiveTrackColor: colorWhite,
          ),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.chat_setIsTop,
        backgroundColor: colorWhite,
        callback: () {},
        trailing: Transform.scale(
          scale: 0.7,
          child: Switch(
            value: false,
            onChanged: (newValue) {},
            activeColor: colorTheme,
            inactiveTrackColor: colorWhite,
          ),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.chat_setIsRemind,
        backgroundColor: colorWhite,
        callback: () {},
        trailing: Transform.scale(
          scale: 0.7,
          child: Switch(
            value: true,
            onChanged: (newValue) {},
            activeColor: colorTheme,
            inactiveTrackColor: colorWhite,
          ),
        ),
        showDivider: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.chat_setBackground,
        backgroundColor: colorWhite,
        callback: () {
          Navigator.of(context).pushNamed(routerSetBackgroundWay);
        },
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        showDivider: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.chat_setClean,
        backgroundColor: colorWhite,
        callback: () {},
      ),
    ];
    List<Widget> actionItems = [];
    for (var menu in menuItems) {
      actionItems.add(
        Column(
          children: [
            ListTile(
              title: Text(
                menu.title,
                style: textThemePrimary.labelMedium!.copyWith(color: colorMain),
              ),
              tileColor: menu.backgroundColor,
              trailing: menu.trailing,
              onTap: menu.callback,
            ),
            if (menu.showBottomBorder)
              Divider(
                height: 1,
                color: colorGrey.withOpacity(opacity1),
              ),
            if (menu.showDivider) const SizedBox(height: 7),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppChatBar(
        title: widget.args.user.nickname,
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
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 10,
              color: colorWhite,
            ),
            BuildUtil.buildPhotoGallery(
              List.unmodifiable([widget.args.user]),
              0,
            ),
            const SizedBox(height: 7),
            ...actionItems,
          ],
        ),
      ),
    );
  }
}
