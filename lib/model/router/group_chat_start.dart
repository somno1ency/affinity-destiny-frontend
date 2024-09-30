import 'package:affinity_destiny/model/router/chat_start_extra.dart';
import 'package:affinity_destiny/model/orm/user.dart';
import 'package:affinity_destiny/model/orm/group.dart';
import 'package:affinity_destiny/model/orm/group_contact.dart';

class GroupChatStartArgs {
  // the group which login user belongs to
  final Group group;
  // the group_contact which login user haves
  final GroupContact groupContact;
  // all members of the group
  final List<User> users;
  final ChatStartExtra extra;

  GroupChatStartArgs({
    required this.group,
    required this.groupContact,
    required this.users,
    this.extra = const ChatStartExtra(
      lastMsg: '',
      lastMsgTime: '',
      unreadCount: 0,
    ),
  });
}
