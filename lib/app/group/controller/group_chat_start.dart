import 'package:affinity_destiny/model/orm/user.dart';
import 'package:affinity_destiny/model/router/chat_start_extra.dart';
import 'package:get/get.dart';
import 'package:english_words/english_words.dart';

import 'dart:math';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/app/shared/controller/shared.dart';
import 'package:affinity_destiny/model/router/group_chat_start.dart';
import 'package:affinity_destiny/model/orm/group.dart';
import 'package:affinity_destiny/model/orm/group_contact.dart';

class GroupChatStartController extends GetxController {
  final int index = 1;
  final String title = LangKey.navMenuGroupChatBlanked.tr;

  final Random _random = Random();

  // in group chat start page, the ChatStartItem component need data from group orm and group_contact orm
  // so combine this to a new object(GroupChatStartArgs) to provide the entry data
  List<GroupChatStartArgs> getGroups() {
    List<GroupChatStartArgs> groups = [];
    for (int i = 0; i < 100; i++) {
      // 1.group part(assume that all below groups are contains the current login user)
      int identity = _random.nextInt(3) + 1;
      Group group = Group(
        id: i,
        name: '${WordPair.random().asPascalCase}_Group',
        ownerId: i,
        customId: 'Group_$i',
        categoryId: i,
        avatar: 'assets/images/avatar/avatar_00$identity.webp',
      );

      // 2.group_contact part
      GroupContact groupContact = GroupContact(
        id: i,
        groupId: group.id,
        userId: SharedController.to.currentUser.id,
        isDisturb: true,
        isTop: false,
        background: '',
        userNickname: SharedController.to.currentUser.nickname,
        isShowNickname: true,
      );

      // 3.user part
      List<User> users = [];
      for (int j = 0; j < 50; j++) {
        User user = User(
          id: j,
          mobile: '19918900$j',
          avatar: 'assets/images/avatar/avatar_00$identity.webp',
          sex: j % 2,
          nickname: WordPair.random().asPascalCase,
        );
        users.add(user);
      }

      // 4.extra msg data
      ChatStartExtra extra = ChatStartExtra(
        lastMsg: 'This is group last msg $i...',
        lastMsgTime: 'Yesterday $i',
        unreadCount: 0,
      );

      // 5.patch all data
      groups.add(GroupChatStartArgs(
        group: group,
        groupContact: groupContact,
        users: users,
        extra: extra,
      ));
    }

    return groups;
  }
}
