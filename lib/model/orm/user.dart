class User {
  final int id;
  final String customId;
  final int categoryId;
  final String categoryName;
  final int categoryStar;
  final String mobile;
  final String nickname;
  final String avatar;
  final int sex;
  final String memo;

  const User({
    required this.id,
    required this.mobile,
    required this.nickname,
    required this.avatar,
    required this.sex,
    this.memo = '',
    this.customId = '',
    this.categoryId = 0,
    this.categoryName = '',
    this.categoryStar = 0,
  });
}
