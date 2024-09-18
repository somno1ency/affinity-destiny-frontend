import '../orm/user.dart';
import '../orm/user_contact.dart';

class ChatInfoArgs {
  final User user;
  final UserContact userContact;

  const ChatInfoArgs({
    required this.user,
    required this.userContact,
  });
}
