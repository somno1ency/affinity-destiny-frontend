import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:english_words/english_words.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/model/component/menu_item.dart';
import 'package:affinity_destiny/model/orm/user.dart';
import 'package:affinity_destiny/model/router/group_info.dart';
import 'package:affinity_destiny/shared/util/build.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

class GroupChatInfoPage extends StatefulWidget {
  final GroupInfoArgs args;

  const GroupChatInfoPage({
    super.key,
    required this.args,
  });

  @override
  State<GroupChatInfoPage> createState() => _GroupInfoPageState();
}

class _GroupInfoPageState extends State<GroupChatInfoPage> {
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
    double trailingWidth = Get.width * 0.6;
    List<MenuItem> menuItems = [
      MenuItem(
        title: LangKey.groupGroupName.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {
          Navigator.of(context).pushNamed(
            AppRouter.groupChatSetName,
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
                style: AppConstant.textThemePrimary.labelMedium!
                    .copyWith(color: AppConstant.colorGrey),
              ),
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
              ),
            ],
          ),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.groupQrCode.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {
          Navigator.of(context).pushNamed(
            AppRouter.groupChatQrCode,
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
                color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
              ),
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
              ),
            ],
          ),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.groupRemark.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {
          Navigator.of(context).pushNamed(
            AppRouter.groupChatSetRemark,
            arguments: widget.args.group,
          );
        },
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        showDivider: true,
      ),
      MenuItem(
        title: LangKey.chatSetIsDisturb.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {},
        trailing: Transform.scale(
          scale: 0.7,
          child: Switch(
            value: true,
            onChanged: (newValue) {},
            activeColor: AppConstant.colorTheme,
            inactiveTrackColor: AppConstant.colorWhite,
          ),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.chatSetIsTop.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {},
        trailing: Transform.scale(
          scale: 0.7,
          child: Switch(
            value: true,
            onChanged: (newValue) {},
            activeColor: AppConstant.colorTheme,
            inactiveTrackColor: AppConstant.colorWhite,
          ),
        ),
        showDivider: true,
      ),
      MenuItem(
        title: LangKey.groupMyName.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {
          Navigator.of(context).pushNamed(
            AppRouter.groupChatSetNickname,
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
                style: AppConstant.textThemePrimary.labelMedium!
                    .copyWith(color: AppConstant.colorGrey),
              ),
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
              ),
            ],
          ),
        ),
        showBottomBorder: true,
      ),
      MenuItem(
        title: LangKey.groupShowNickname.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {},
        trailing: Transform.scale(
          scale: 0.7,
          child: Switch(
            value: true,
            onChanged: (newValue) {},
            activeColor: AppConstant.colorTheme,
            inactiveTrackColor: AppConstant.colorWhite,
          ),
        ),
        showDivider: true,
      ),
      MenuItem(
        title: LangKey.chatSetBackground.tr,
        backgroundColor: AppConstant.colorWhite,
        callback: () {
          Navigator.of(context).pushNamed(AppRouter.setBackgroundWay);
        },
        trailing: Icon(
          EvaIcons.chevronRightOutline,
          size: 30,
          color: AppConstant.colorGrey.withOpacity(AppConstant.opacity7),
        ),
        showDivider: true,
      ),
      MenuItem(
        title: LangKey.chatSetClean.tr,
        backgroundColor: AppConstant.colorWhite,
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
                style: AppConstant.textThemePrimary.labelMedium!
                    .copyWith(color: AppConstant.colorMain),
              ),
              tileColor: menu.backgroundColor,
              trailing: menu.trailing,
              onTap: menu.callback,
            ),
            if (menu.showBottomBorder)
              Divider(
                height: 1,
                color: AppConstant.colorGrey.withOpacity(AppConstant.opacity1),
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
          color: AppConstant.colorWhite,
          onPressed: () {
            Get.back();
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
              color: AppConstant.colorWhite,
            ),
            BuildUtil.buildPhotoGallery(_fakeUsers, _showCount),
            if (_fakeUsers.length > _showCount)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRouter.groupChatMemberInfo,
                    arguments: _fakeUsers,
                  );
                },
                child: Container(
                  height: 30,
                  width: double.infinity,
                  color: AppConstant.colorWhite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LangKey.groupAllMember.tr,
                        textAlign: TextAlign.center,
                        style: AppConstant.textThemePrimary.labelMedium!
                            .copyWith(color: AppConstant.colorMain),
                      ),
                      Icon(
                        EvaIcons.chevronRightOutline,
                        size: 30,
                        color: AppConstant.colorGrey
                            .withOpacity(AppConstant.opacity7),
                      )
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 7),
            ...actionItems,
            ListTile(
              title: Text(
                LangKey.groupQuit.tr,
                textAlign: TextAlign.center,
                style: AppConstant.textThemePrimary.bodySmall!
                    .copyWith(color: AppConstant.colorRed),
              ),
              tileColor: AppConstant.colorWhite,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
