import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

import '../../component/chat/app_chat_bar.dart';
import '../../component/chat/chat_item.dart';
import '../../component/chat/chat_input_bar.dart';
import '../../model/component/enumeration/message_type.dart';
import '../../model/component/chat_msg.dart';
import '../../model/orm/user.dart';
import '../../model/orm/user_contact.dart';
import '../../model/router/chat_args.dart';
import '../../model/router/chat_info_args.dart';
import '../../shared/util/build_util.dart';
import '../../shared/constant.dart';

class ChatPage extends StatefulWidget {
  final ChatArgs args;

  const ChatPage({
    super.key,
    required this.args,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool _isBottomMenuOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title: widget.args.targetUser.nickname,
        icon: EvaIcons.bellOffOutline,
        leading: IconButton(
          icon: const Icon(
            Ionicons.arrow_undo_outline,
            size: 24,
          ),
          color: colorWhite,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              EvaIcons.moreHorizontalOutline,
              size: 24,
            ),
            color: colorWhite,
            onPressed: () {
              UserContact userContact = UserContact(
                id: 1,
                ownerId: widget.args.currentUser.id,
                dstId: widget.args.targetUser.id,
                isDisturb: false,
                isTop: false,
                isRemind: false,
                background: '',
              );
              Navigator.of(context).pushNamed(
                routerSingleDetail,
                arguments: ChatInfoArgs(
                  user: widget.args.targetUser,
                  userContact: userContact,
                ),
              );
            },
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: _buildChatItems(),
          ),
        ),
        ChatInputBar(
          controller: TextEditingController(),
          callback: () {
            _toggleBottomMenu();
          },
        ),
        if (_isBottomMenuOpen) BuildUtil.buildChatBottomMenu(context),
      ],
    );
  }

  List<ChatItem> _buildChatItems() {
    Random random = Random();
    List<ChatItem> fakeItems = [];
    generateWordPairs().take(50).forEach((e) {
      int identity = random.nextInt(3) + 1;
      MessageType type;
      switch (identity) {
        case 1:
          type = MessageType.left;
          break;
        case 2:
          type = MessageType.right;
          break;
        case 3:
          type = MessageType.time;
          break;
        default:
          type = MessageType.time;
      }
      fakeItems.add(
        ChatItem(
          chatMsg: ChatMsg(
            name: WordPair.random().asPascalCase,
            msg: type == MessageType.time ? '12:00' : e.asPascalCase,
            type: type,
            avatar: 'assets/images/avatar/avatar_00$identity.webp',
          ),
          isShowName: false,
        ),
      );
    });

    return fakeItems;
  }

  void _toggleBottomMenu() {
    setState(() {
      _isBottomMenuOpen = !_isBottomMenuOpen;
    });
  }
}
