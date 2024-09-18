import '../orm/user.dart';
import '../orm/group.dart';

class GroupArgs {
  final User currentUser;
  final Group targetGroup;

  const GroupArgs({
    required this.currentUser,
    required this.targetGroup,
  });
}
