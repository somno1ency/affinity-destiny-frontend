import 'package:affinity_destiny/model/router/group_info_args.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

import '../../component/chat/app_chat_bar.dart';
import '../../component/chat/chat_item.dart';
import '../../component/chat/chat_input_bar.dart';
import '../../model/router/group_args.dart';
import '../../model/component/enumeration/message_type.dart';
import '../../model/component/chat_msg.dart';
import '../../model/orm/group.dart';
import '../../model/orm/user.dart';
import '../../shared/util/build_util.dart';
import '../../shared/constant.dart';

class GroupPage extends StatefulWidget {
  final GroupArgs args;

  const GroupPage({
    super.key,
    required this.args,
  });

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  bool _isBottomMenuOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title: widget.args.targetGroup.name,
        icon: EvaIcons.bellOffOutline,
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
        actions: [
          IconButton(
            icon: const Icon(
              EvaIcons.moreHorizontalOutline,
              size: 24,
            ),
            color: colorWhite,
            onPressed: () {
              Navigator.of(context).pushNamed(
                routerGroupDetail,
                arguments: GroupInfoArgs(
                  user: widget.args.currentUser,
                  group: widget.args.targetGroup,
                ),
              );
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
              _toggleBottomMenu();
            },
          ),
          if (_isBottomMenuOpen) BuildUtil.buildChatBottomMenu(context),
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

  void _toggleBottomMenu() {
    setState(() {
      _isBottomMenuOpen = !_isBottomMenuOpen;
    });
  }
}
