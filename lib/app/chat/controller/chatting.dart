import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:english_words/english_words.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'dart:math';

import 'package:affinity_destiny/model/router/chat_start.dart';
import 'package:affinity_destiny/app/chat/state/chatting.dart';
import 'package:affinity_destiny/component/chat/chatting_msg.dart';
import 'package:affinity_destiny/model/enumeration/message_type.dart';
import 'package:affinity_destiny/model/component/chat_msg.dart';

class ChattingController extends GetxController {
  // 1.first part: variables in current controller, it's not the obs value maybe updated by ui but used by ui
  // animation variables located to here too
  late ChatStartArgs args;

  // 2.second part: state object, all variables in it are obs value maybe updated by ui and used by ui
  final ChattingState state = ChattingState();

  // 3.third part: variables in current controller, it's not the obs value maybe updated by ui but used by ui
  final Random _random = Random();

  IconData get bellIcon => args.userContact.isDisturb
      ? EvaIcons.bellOffOutline
      : EvaIcons.bellOutline;

  @override
  void onInit() {
    super.onInit();
    args = Get.arguments as ChatStartArgs;
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
          isShowName: false,
        ),
      );
    });

    return chattingMsgs;
  }
}
