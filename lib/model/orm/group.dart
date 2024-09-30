class Group {
  final int id;
  final String customId;
  final int categoryId;
  final String categoryName;
  final int categoryStar;
  final String name;
  final int ownerId;
  final String avatar;
  final String memo;

  const Group({
    required this.id,
    required this.name,
    required this.ownerId,
    this.customId = '',
    this.avatar = '',
    this.memo = '',
    this.categoryId = 0,
    this.categoryName = '',
    this.categoryStar = 0,
  });
}
