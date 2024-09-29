import 'package:get/get.dart';
import 'package:english_words/english_words.dart';

import 'dart:math';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/model/component/chat_start_item.dart';

class GroupChatStartController extends GetxController {
  final Random _random = Random();

  final int index = 1;
  final String title = LangKey.navMenuGroupChatBlanked.tr;

  List<ChatStartItem> getChatListItems() {
    List<ChatStartItem> fakeInfoItems = [];
    for (int i = 0; i < 100; i++) {
      int identity = _random.nextInt(3) + 1;
      fakeInfoItems.add(
        ChatStartItem(
          avatar: 'assets/images/avatar/avatar_00$identity.webp',
          name: '${WordPair.random().asPascalCase}_Group',
          lastMsg: 'This is group last msg $i...',
          unreadCount: _random.nextInt(10) * 10,
          lastMsgTime: 'Yesterday $i',
          isDisturb: i % 2 == 0,
        ),
      );
    }

    return fakeInfoItems;
  }
}
