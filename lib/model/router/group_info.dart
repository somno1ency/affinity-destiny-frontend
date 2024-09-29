import 'package:affinity_destiny/model/orm/user.dart';
import 'package:affinity_destiny/model/orm/group.dart';

class GroupInfoArgs {
  final User user;
  final Group group;

  const GroupInfoArgs({
    required this.user,
    required this.group,
  });
}
