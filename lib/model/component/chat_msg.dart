import 'message_type_enum.dart';

class ChatMsg {
  final String? avatar;
  final String? name;
  final String msg;
  final MessageType type;
  // although time must be an attr of a msg, but in the user face, not need to display one by one, just like wechat, will
  // show the time by appropriate aggregation, so time will be a single msg, the real time words will in the content,
  // we need to consider the moment when the msg is sent
  // final String time;

  const ChatMsg({
    required this.msg,
    required this.type,
    this.avatar,
    this.name,
    // required this.time,
  });
}
