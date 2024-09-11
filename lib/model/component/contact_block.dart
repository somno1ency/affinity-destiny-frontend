import '../orm/user.dart';

class ContactBlock {
  // 联系人分组显示可分为两种: 1.以字母序显示联系人分组 2.以用户自定义分组的优先级顺序展示自定义联系人分组
  // 以上两种分组方式都支持按组折叠,其折叠状态需要保持,但不必到库,存在手机本地即可
  final String blockName;
  final List<User> users;

  const ContactBlock({
    required this.blockName,
    required this.users,
  });
}
