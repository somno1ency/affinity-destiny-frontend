import 'message_type_enum.dart';

class ChatMsg {
  final String? avatar;
  final String? name;
  final String msg;
  final MessageType type;
  // 虽然时间肯定是消息的一条属性,但是在聊天界面中每条消息展示时间却不友好,像微信类似的处理比较合适,对于时间有适当的聚合,所以时间也作为一条单
  // 独的消息发送,时间内容放在msg中,只是发送的时机需要再考虑,故此处时间字段注释掉(避免抓包抓到,反正也不在前端显示)
  // final String time;

  const ChatMsg({
    required this.msg,
    required this.type,
    this.avatar,
    this.name,
    // required this.time,
  });
}
