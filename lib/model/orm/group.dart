class Group {
  final int id;
  final int ownerId;
  final String groupId;
  final String name;
  final String icon;
  final int category;
  final String memo;

  const Group({
    required this.id,
    required this.ownerId,
    required this.groupId,
    required this.name,
    required this.category,
    this.icon = '',
    this.memo = '',
  });
}
