import '../orm/user.dart';

class ContactBlock {
  // contact user display by group will be two kind:
  // 1.display with alphabetical order
  // 2.display with custom group order(sort by star desc)
  // they are both supported to fold and unfold, and persist status in local rather than db
  final String blockName;
  final List<User> users;

  const ContactBlock({
    required this.blockName,
    required this.users,
  });
}
