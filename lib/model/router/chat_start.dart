import 'package:affinity_destiny/model/router/chat_start_extra.dart';
import 'package:affinity_destiny/model/orm/user.dart';
import 'package:affinity_destiny/model/orm/user_contact.dart';

class ChatStartArgs {
  final User user;
  final UserContact userContact;
  final ChatStartExtra extra;

  ChatStartArgs({
    required this.user,
    required this.userContact,
    this.extra = const ChatStartExtra(
      lastMsg: '',
      lastMsgTime: '',
      unreadCount: 0,
    ),
  });
}
