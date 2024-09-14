import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

import '../../component/chat/app_chat_bar.dart';
import '../../component/shared/custom_input.dart';
import '../../component/chat/chat_list_item.dart';
import '../../model/orm/user.dart';
import '../../model/component/chat_list_item_info.dart';
import '../../shared/constant.dart';
import '../../shared/util/build_util.dart';

class ChatListPage extends StatefulWidget {
  final String title;

  const ChatListPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final Random _random = Random();
  User get currentUser => const User(
        id: 1,
        mobile: '19918900255',
        avatar: '/assets/images/avatar/avatar_001.webp',
        sex: 1,
        nickname: '叶落无痕',
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title: widget.title,
        actions: _buildActions(context),
      ),
      body: _buildBody(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      PopupMenuButton<String>(
        itemBuilder: _buildItem,
        onSelected: (value) {},
        icon: const Icon(EvaIcons.plusCircleOutline),
        iconSize: 24,
        iconColor: colorWhite,
        color: colorWhite,
        position: PopupMenuPosition.under,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      )
    ];
  }

  List<PopupMenuEntry<String>> _buildItem(BuildContext context) {
    return [
      BuildUtil.buildPopupMenuItem(
        Ionicons.chatbubble_ellipses_outline,
        Theme.of(context).primaryColor,
        AppLocalizations.of(context)!.chat_startGroupChat,
        Theme.of(context)
            .primaryTextTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).primaryColor),
        () {},
      ),
      BuildUtil.buildPopupMenuItem(
        Ionicons.person_add,
        Theme.of(context).primaryColor,
        AppLocalizations.of(context)!.chat_addFriend,
        Theme.of(context)
            .primaryTextTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).primaryColor),
        () {},
      ),
    ];
  }

  Widget _buildBody(BuildContext context) {
    List<ChatListItemInfo> fakeInfoItems = [];
    for (int i = 0; i < 100; i++) {
      int identity = _random.nextInt(3) + 1;
      fakeInfoItems.add(
        ChatListItemInfo(
          avatar: 'assets/images/avatar/avatar_00$identity.webp',
          name: WordPair.random().asPascalCase,
          lastMsg: 'This is my last msg $i...',
          unreadCount: _random.nextInt(10) * 10,
          lastMsgTime: 'Yesterday $i',
          isDisturb: i % 2 == 0,
        ),
      );
    }

    return Column(
      children: [
        CustomInput(
          color: Theme.of(context).primaryColor,
          hintText: AppLocalizations.of(context)!.search_placeholder,
          hintStyle: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
              color: Theme.of(context).primaryColor.withOpacity(opacity5)),
          fontSize: 12,
          isCenter: false,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: fakeInfoItems.length,
            itemBuilder: (context, index) {
              return ChatListItem(
                chatListItemInfo: fakeInfoItems[index],
                callback: () {
                  User targetUser = User(
                    id: index,
                    mobile: '13874315555',
                    avatar: fakeInfoItems[index].avatar ?? '',
                    sex: 2,
                    nickname: fakeInfoItems[index].name,
                  );
                  Navigator.pushNamed(
                    context,
                    routerSingleChat,
                    arguments: {
                      'currentUser': currentUser,
                      'targetUser': targetUser,
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
