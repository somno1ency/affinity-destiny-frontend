import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:english_words/english_words.dart';

import 'dart:math';

import '../../component/shared/app_chat_bar.dart';
import '../../component/shared/custom_input.dart';
import '../../component/shared/chat_list_item.dart';

import '../../model/user/user.dart';
import '../../shared/constant.dart';

class ChatListPage extends StatefulWidget {
  final String title;

  const ChatListPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title: widget.title,
        actions: [
          IconButton(
            icon: const Icon(EvaIcons.plusCircleOutline),
            color: Colors.white,
            onPressed: () {
              _showAddMenu(context);
            },
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    Random _random = Random();
    List<ChatListItem> fakeItems = [];
    for (int i = 0; i < 100; i++) {
      User currentUser = const User(
        id: 1,
        mobile: '19918900255',
        avatar: '/assets/images/avatar_001.webp',
        sex: 1,
        nickname: '叶落无痕',
      );
      User targetUser = User(
        id: i,
        mobile: '13874315555',
        avatar: '/assets/images/avatar_002.webp',
        sex: 2,
        nickname: '听风有声',
      );
      fakeItems.add(
        ChatListItem(
          avatar: 'assets/images/avatar_001.webp',
          name: WordPair.random().asPascalCase,
          msg: 'This is my las msg $i...',
          unreadCount: _random.nextInt(10) * 10,
          time: 'Yesterday $i',
          isDisturb: i % 2 == 0,
          callback: () {
            Navigator.pushNamed(context, routerSingleChat, arguments: {
              'currentUser': currentUser,
              'targetUser': targetUser,
            });
          },
        ),
      );
    }

    return Column(
      children: [
        CustomInput(
          color: Theme.of(context).primaryColor,
          hintText: AppLocalizations.of(context)!.search_placeholder,
          hintStyle: Theme.of(context)
              .primaryTextTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).primaryColor.withOpacity(0.5)),
          fontSize: 12,
          isCenter: false,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: fakeItems.length,
            itemBuilder: (context, index) {
              return ChatListItem(
                avatar: fakeItems[index].avatar,
                name: fakeItems[index].name,
                msg: fakeItems[index].msg,
                unreadCount: fakeItems[index].unreadCount,
                time: fakeItems[index].time,
                isDisturb: fakeItems[index].isDisturb,
                callback: fakeItems[index].callback,
              );
            },
          ),
        ),
      ],
    );
  }

  void _showAddMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero);
    final double x = offset.dx + button.size.width;
    final double y = offset.dy;

    showMenu(
      context: context,
      elevation: 0,
      shadowColor: Colors.transparent,
      position: RelativeRect.fromLTRB(x, y, 0, 0),
      items: [
        _buildMenuItem(
          context,
          AppLocalizations.of(context)!.chat_startGroupChat,
          Ionicons.chatbubble_ellipses_outline,
          () {},
        ),
        _buildMenuItem(
          context,
          AppLocalizations.of(context)!.chat_addFriend,
          Ionicons.person_add_outline,
          () {},
        ),
      ],
    );
  }

  PopupMenuItem _buildMenuItem(BuildContext context, String label,
      IconData icon, VoidCallback callback) {
    return PopupMenuItem(
      onTap: callback,
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 16,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: Theme.of(context)
                .primaryTextTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
