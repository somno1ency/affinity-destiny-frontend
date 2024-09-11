class ChatListItemInfo {
  final String? avatar;
  final String name;
  final String? lastMsg;
  final String? lastMsgTime;
  final int unreadCount;
  final bool isDisturb;

  const ChatListItemInfo({
    required this.name,
    this.avatar,
    this.lastMsg,
    this.lastMsgTime,
    this.unreadCount = 0,
    this.isDisturb = false,
  });
}
