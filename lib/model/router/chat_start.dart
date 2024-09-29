import 'package:affinity_destiny/model/orm/user.dart';
import 'package:affinity_destiny/model/orm/user_contact.dart';

class ChatStartArgs {
  final User user;
  final UserContact userContact;

  // some dynamic msg data
  final String lastMsg;
  final String lastMsgTime;
  final int unreadCount;

  const ChatStartArgs({
    required this.user,
    required this.userContact,
    this.lastMsg = '',
    this.lastMsgTime = '',
    this.unreadCount = 0,
  });
}
