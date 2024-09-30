import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:english_words/english_words.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'dart:math';

import 'package:affinity_destiny/app/group/state/group_chatting.dart';
import 'package:affinity_destiny/model/router/group_chat_start.dart';
import 'package:affinity_destiny/component/chat/chatting_msg.dart';
import 'package:affinity_destiny/model/enumeration/message_type.dart';
import 'package:affinity_destiny/model/component/chat_msg.dart';

class GroupChattingController extends GetxController {
  late GroupChatStartArgs args;

  final GroupChattingState state = GroupChattingState();

  final Random _random = Random();

  IconData get bellIcon => args.groupContact.isDisturb
      ? EvaIcons.bellOffOutline
      : EvaIcons.bellOutline;

  @override
  void onInit() {
    super.onInit();
    args = Get.arguments as GroupChatStartArgs;
  }

  @override
  void onReady() {
    super.onReady();
    state.chattingMsgs.value = _initChattingMsgs();
  }

  void onToggleBottomMenu() {
    state.isBottomMenuOpen.value = !state.isBottomMenuOpen.value;
  }

  void onCloseBottomMenu() {
    if (state.isBottomMenuOpen.value) {
      state.isBottomMenuOpen.value = false;
    }
  }

  List<ChattingMsg> _initChattingMsgs() {
    List<ChattingMsg> chattingMsgs = [];
    generateWordPairs().take(50).forEach((e) {
      int identity = _random.nextInt(3) + 1;
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
      chattingMsgs.add(
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

    return chattingMsgs;
  }
}
