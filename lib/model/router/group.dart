import 'package:affinity_destiny/model/orm/user.dart';
import 'package:affinity_destiny/model/orm/group.dart';

class GroupArgs {
  final User currentUser;
  final Group targetGroup;

  const GroupArgs({
    required this.currentUser,
    required this.targetGroup,
  });
}
