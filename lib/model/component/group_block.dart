import '../orm/group.dart';

class GroupBlock {
  // group display by group will be two kind:
  // 1.display with alphabetical order
  // 2.display with custom group order(sort by star desc)
  // they are both supported to fold and unfold, and persist status in local rather than db
  final String blockName;
  final List<Group> groups;

  const GroupBlock({
    required this.blockName,
    required this.groups,
  });
}
