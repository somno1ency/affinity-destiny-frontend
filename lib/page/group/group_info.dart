import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:english_words/english_words.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../component/chat/app_chat_bar.dart';
import '../../model/component/menu_item.dart';
import '../../model/orm/user.dart';
import '../../model/router/group_info_args.dart';
import '../../shared/util/build_util.dart';
import '../../shared/constant.dart';

class GroupInfoPage extends StatefulWidget {
  final GroupInfoArgs args;

  const GroupInfoPage({
    super.key,
    required this.args,
  });

  @override
  State<GroupInfoPage> createState() => _GroupInfoPageState();
}

class _GroupInfoPageState extends State<GroupInfoPage> {
  final int _showCount = 23;
  final List<User> _fakeUsers = [];

  @override
  void initState() {
    super.initState();
    _initFakeUsers();
  }

  void _initFakeUsers() {
    for (int i = 0; i < 100; i++) {
      _fakeUsers.add(
        User(
          id: i + 1,
          mobile: '19918900$i',
          avatar: 'assets/images/avatar/avatar_00${(i % 3) + 1}.webp',
          sex: i % 2 == 0 ? 1 : 0,
          nickname: generateWordPairs().take(1).toList().first.asPascalCase,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double trailingWidth = MediaQuery.of(context).size.width * 0.6;
    List<MenuItem> menuItems = [
      MenuItem(
        title: AppLocalizations.of(context)!.group_groupName,
        backgroundColor: colorWhite,
        callback: () {
          Navigator.of(context).pushNamed(
            routerGroupSetName,
            arguments: widget.args.group,
          );
        },
        trailing: SizedBox(
          width: trailingWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.args.group.name,
                style: textThemePrimary.labelMedium!.copyWith(color: colorGrey),
              ),
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: colorGrey.withOpacity(opacity7),
              ),
            ],
          ),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.group_qrCode,
        backgroundColor: colorWhite,
        callback: () {
          Navigator.of(context).pushNamed(
            routerGroupQrCode,
            arguments: widget.args.group,
          );
        },
        trailing: SizedBox(
          width: trailingWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Ionicons.qr_code_outline,
                size: 30,
                color: colorGrey.withOpacity(opacity7),
              ),
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: colorGrey.withOpacity(opacity7),
              ),
            ],
          ),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.group_remark,
        backgroundColor: colorWhite,
        callback: () {
          Navigator.of(context).pushNamed(
            routerGroupSetRemark,
            arguments: widget.args.group,
          );
        },
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: colorGrey.withOpacity(opacity7),
        ),
        showDivider: true,
      ),
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
            value: true,
            onChanged: (newValue) {},
            activeColor: colorTheme,
            inactiveTrackColor: colorWhite,
          ),
        ),
        showDivider: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.group_myName,
        backgroundColor: colorWhite,
        callback: () {
          Navigator.of(context).pushNamed(
            routerGroupSetNickname,
            arguments: widget.args.group,
          );
        },
        trailing: SizedBox(
          width: trailingWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.args.user.nickname,
                style: textThemePrimary.labelMedium!.copyWith(color: colorGrey),
              ),
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: colorGrey.withOpacity(opacity7),
              ),
            ],
          ),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.group_showNickname,
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
        showDivider: true,
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
        title: '${widget.args.group.name} (${_fakeUsers.length})',
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
            BuildUtil.buildPhotoGallery(_fakeUsers, _showCount),
            if (_fakeUsers.length > _showCount)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    routerGroupMemberDetail,
                    arguments: _fakeUsers,
                  );
                },
                child: Container(
                  height: 30,
                  width: double.infinity,
                  color: colorWhite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.group_allMember,
                        textAlign: TextAlign.center,
                        style: textThemePrimary.labelMedium!
                            .copyWith(color: colorMain),
                      ),
                      Icon(
                        EvaIcons.chevronRightOutline,
                        size: 30,
                        color: colorGrey.withOpacity(opacity7),
                      )
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 7),
            ...actionItems,
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.group_quit,
                textAlign: TextAlign.center,
                style: textThemePrimary.bodySmall!.copyWith(color: colorRed),
              ),
              tileColor: colorWhite,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
