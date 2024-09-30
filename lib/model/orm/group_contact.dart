class GroupContact {
  final int id;
  final int groupId;
  final int userId;
  final String userNickname;
  final String remark;
  final String background;
  final bool isDisturb;
  final bool isTop;
  final bool isShowNickname;

  const GroupContact({
    required this.id,
    required this.groupId,
    required this.userId,
    required this.userNickname,
    required this.background,
    required this.isDisturb,
    required this.isTop,
    this.remark = '',
    this.isShowNickname = false,
  });
}
