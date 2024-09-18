class UserContact {
  final int id;
  final int ownerId;
  final int dstId;
  // TODO need to add to table for record the specific settings for each user
  final bool isDisturb;
  final bool isTop;
  final bool isRemind;
  final String background;

  const UserContact({
    required this.id,
    required this.ownerId,
    required this.dstId,
    required this.isDisturb,
    required this.isTop,
    required this.isRemind,
    required this.background,
  });
}
