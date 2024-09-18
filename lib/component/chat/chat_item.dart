import 'package:flutter/material.dart';
import 'package:wrapper/wrapper.dart';

import '../../model/component/chat_msg.dart';
import '../../model/component/enumeration/message_type.dart';
import '../../shared/constant.dart';

class ChatItem extends StatelessWidget {
  final ChatMsg chatMsg;
  final bool isShowName;

  const ChatItem({
    super.key,
    required this.chatMsg,
    this.isShowName = true,
  });

  bool get isLeft => chatMsg.type == MessageType.left;

  EdgeInsets get contentPadding => isLeft
      ? const EdgeInsets.only(left: 10, right: 50 + 10, top: 8, bottom: 2)
      : const EdgeInsets.only(left: 50 + 10, right: 10, top: 8, bottom: 2);

  EdgeInsets get iconPadding =>
      isLeft ? const EdgeInsets.only(right: 5) : const EdgeInsets.only(left: 5);

  Color get panelColor => isLeft ? colorYourMsg : colorMyMsg;

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
          style: textThemePrimary.labelMedium!.copyWith(color: colorChatSub),
        ),
      ),
    );
  }

  // wechat style
  // Widget _buildAvatar() {
  //   return Container(
  //     height: 40,
  //     width: 40,
  //     margin: iconPadding,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(3),
  //       image: DecorationImage(
  //         image: AssetImage(
  //           chatMsg.avatar ?? '',
  //         ),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildAvatar(BuildContext context) {
    return chatMsg.avatar != null
        ? CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(chatMsg.avatar!),
          )
        : CircleAvatar(
            radius: 25,
            backgroundColor: colorTheme.withOpacity(opacity5),
            child: Text(
              chatMsg.name == null ? '' : chatMsg.name![0],
              style: textThemePrimary.bodyMedium!.copyWith(color: colorGrey),
            ),
          );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: isShowName && chatMsg.name == null ? 3 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isShowName && chatMsg.name != null)
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 4),
              child: Text(
                chatMsg.name!,
                style:
                    textThemePrimary.labelMedium!.copyWith(color: colorChatSub),
              ),
            ),
          Padding(
            padding:
                EdgeInsets.only(left: isLeft ? 5 : 0, right: isLeft ? 0 : 5),
            child: Wrapper(
              spineType: spineType,
              elevation: 0.5,
              spineHeight: 6,
              shadowColor: colorGrey.withOpacity(opacity3),
              offset: 12,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 10,
              ),
              color: panelColor,
              child: Text(
                chatMsg.msg,
                style: textThemePrimary.bodySmall!.copyWith(color: colorBlack),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
