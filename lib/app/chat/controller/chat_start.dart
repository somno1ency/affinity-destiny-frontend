import 'package:get/get.dart';
import 'package:english_words/english_words.dart';

import 'dart:math';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/app/shared/controller/shared.dart';
import 'package:affinity_destiny/model/orm/user.dart';
import 'package:affinity_destiny/model/orm/user_contact.dart';
import 'package:affinity_destiny/model/router/chat_start.dart';

class ChatStartController extends GetxController {
  final int index = 0;
  final String title = LangKey.navMenuSingleChatBlanked.tr;

  final Random _random = Random();

  // in chat start page, the ChatStartItem component need data from user orm and user_contact orm
  // so combine this to a new object(ChatStartArgs) to provide the entry data
  List<ChatStartArgs> getUsers() {
    List<ChatStartArgs> users = [];
    for (int i = 0; i < 100; i++) {
      // 1.user part
      int identity = _random.nextInt(3) + 1;
      User user = User(
        id: i,
        mobile: '19918900$i',
        avatar: 'assets/images/avatar/avatar_00$identity.webp',
        sex: i % 2,
        nickname: WordPair.random().asPascalCase,
      );

      // 2.user_contact part
      UserContact userContact = UserContact(
        id: i,
        ownerId: SharedController.to.currentUser.id,
        dstId: i,
        isDisturb: i % 2 == 0,
        isTop: i % 2 == 1,
        isRemind: i % 2 == 0,
        background: '',
      );

      // 3.dynamic msg data
      users.add(ChatStartArgs(
        user: user,
        userContact: userContact,
        lastMsg: 'This is my last msg $i...',
        lastMsgTime: 'Yesterday $i',
        unreadCount: _random.nextInt(10) * 10,
      ));
    }

    return users;
  }
}
