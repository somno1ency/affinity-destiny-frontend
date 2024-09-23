class User {
  final int id;
  final String customId;
  final String mobile;
  final String avatar;
  final int sex;
  final int categoryId;
  final String categoryName;
  final int categoryStar;
  final String nickname;

  const User({
    required this.id,
    required this.mobile,
    required this.avatar,
    required this.sex,
    required this.nickname,
    this.customId = '',
    this.categoryId = 0,
    this.categoryName = '',
    this.categoryStar = 0,
  });
}
