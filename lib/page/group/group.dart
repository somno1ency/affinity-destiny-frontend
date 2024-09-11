import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:english_words/english_words.dart';

import 'dart:math';

import '../../component/chat/app_chat_bar.dart';
import '../../component/chat/chat_item.dart';
import '../../component/chat/chat_input_bar.dart';
import '../../model/orm/user.dart';
import '../../model/orm/group.dart';
import '../../model/component/message_type_enum.dart';
import '../../model/component/chat_msg.dart';
import '../../shared/constant.dart';

class GroupPage extends StatelessWidget {
  // the login user info, will retrieve from token instead
  final User? currentUser;
  // chat target group info
  final Group? targetGroup;

  // not required is that we must definition the router first in router.dart, but at that moment, we don't know the future
  // dynamic parameter value
  const GroupPage({
    super.key,
    this.currentUser,
    this.targetGroup,
  });

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final currentUser = arguments?['currentUser'];
    final targetGroup = arguments?['targetGroup'];

    return Scaffold(
      appBar: AppChatBar(
        title: targetGroup.name,
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
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: _buildChatItems(),
            ),
          ),
          ChatInputBar(
            controller: TextEditingController(),
            callback: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
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
          isShowName: true,
        ),
      );
    });

    return fakeItems;
  }
}
