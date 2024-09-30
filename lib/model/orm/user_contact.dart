class UserContact {
  final int id;
  final int ownerId;
  final int dstId;
  final String background;
  final bool isDisturb;
  final bool isTop;
  final bool isRemind;

  const UserContact({
    required this.id,
    required this.ownerId,
    required this.dstId,
    required this.background,
    required this.isDisturb,
    required this.isTop,
    required this.isRemind,
  });
}
