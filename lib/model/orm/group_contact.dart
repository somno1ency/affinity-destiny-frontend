class GroupContact {
  final int id;
  final int groupId;
  final int userId;
  // TODO: need to add the below fields to table for record the specific settings for each user
  final bool isDisturb;
  final bool isTop;
  final bool isRemind;
  final String background;
  final String userNickname;
  final bool isShowNickname;

  const GroupContact({
    required this.id,
    required this.groupId,
    required this.userId,
    required this.isDisturb,
    required this.isTop,
    required this.isRemind,
    required this.background,
    required this.userNickname,
    this.isShowNickname = false,
  });
}
