import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:english_words/english_words.dart';

import 'dart:math';

import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/component/chat/chatting_msg.dart';
import 'package:affinity_destiny/component/chat/chat_input_bar.dart';
import 'package:affinity_destiny/model/router/group.dart';
import 'package:affinity_destiny/model/router/group_info.dart';
import 'package:affinity_destiny/model/enumeration/message_type.dart';
import 'package:affinity_destiny/model/component/chat_msg.dart';
import 'package:affinity_destiny/shared/util/build.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

class GroupChattingPage extends StatefulWidget {
  final GroupArgs args;

  const GroupChattingPage({
    super.key,
    required this.args,
  });

  @override
  State<GroupChattingPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupChattingPage> {
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
          color: AppConstant.colorWhite,
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              EvaIcons.moreHorizontalOutline,
              size: 24,
            ),
            color: AppConstant.colorWhite,
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRouter.groupChatInfo,
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

  List<ChattingMsg> _buildChatItems() {
    Random random = Random();
    List<ChattingMsg> fakeItems = [];
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
        ChattingMsg(
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
