import 'package:flutter/material.dart';
import 'package:wrapper/wrapper.dart';

import '../../model/chat/chat_msg.dart';
import '../../model/chat/message_type_enum.dart';

class ChatItem extends StatelessWidget {
  final ChatMsg chatMsg;

  const ChatItem({
    super.key,
    required this.chatMsg,
  });

  bool get isLeft => chatMsg.type == MessageType.left;

  EdgeInsets get contentPadding => isLeft
      ? const EdgeInsets.only(left: 15, right: 40 + 15, top: 5, bottom: 5)
      : const EdgeInsets.only(right: 40 + 15, left: 15, top: 5, bottom: 5);

  EdgeInsets get iconPadding =>
      isLeft ? const EdgeInsets.only(right: 5) : const EdgeInsets.only(left: 5);

  Color get panelColor => isLeft ? Colors.white : const Color(0xff96EC6D);

  TextDirection get textDirection =>
      isLeft ? TextDirection.ltr : TextDirection.rtl;

  SpineType get spineType => isLeft ? SpineType.left : SpineType.right;

  @override
  Widget build(BuildContext context) {
    if (chatMsg.type == MessageType.time) {
      return _buildTime(context);
    }

    return Padding(
      padding: contentPadding,
      child: Row(
        textDirection: textDirection,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAvatar(context),
          Flexible(child: _buildContent(context)),
        ],
      ),
    );
  }

  Widget _buildTime(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          chatMsg.msg,
          style: Theme.of(context)
              .primaryTextTheme
              .labelMedium!
              .copyWith(color: const Color(0xff969696)),
        ),
      ),
    );
  }

  // 这是微信样式
  // Widget _buildAvatar() {
  //   return Container(
  //     height: 40,
  //     width: 40,
  //     margin: iconPadding,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(3),
  //         image: DecorationImage(
  //           image: AssetImage(
  //             msg.avatar ?? '',
  //           ),
  //           fit: BoxFit.cover,
  //         )),
  //   );
  // }

  Widget _buildAvatar(BuildContext context) {
    return chatMsg.avatar != null
        ? CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(chatMsg.avatar!),
          )
        : CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
            child: Text(
              chatMsg.name == null ? '' : chatMsg.name!.substring(0, 1),
              style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
            ),
          );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 4),
            child: Text(
              chatMsg.name == null ? '' : chatMsg.name!,
              style: Theme.of(context)
                  .primaryTextTheme
                  .labelMedium!
                  .copyWith(color: const Color(0xff969696)),
            ),
          ),
          Wrapper(
            spineType: spineType,
            elevation: .5,
            spineHeight: 6,
            shadowColor: Colors.grey.withOpacity(0.3),
            offset: 12,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            color: panelColor,
            child: Text(
              chatMsg.msg,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
