import '../orm/user.dart';
import '../orm/group.dart';

class GroupInfoArgs {
  final User user;
  final Group group;

  const GroupInfoArgs({
    required this.user,
    required this.group,
  });
}
