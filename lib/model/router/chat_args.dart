import '../orm/user.dart';

class ChatArgs {
  final User currentUser;
  final User targetUser;

  const ChatArgs({
    required this.currentUser,
    required this.targetUser,
  });
}
