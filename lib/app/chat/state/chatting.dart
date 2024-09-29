import 'package:get/get.dart';

import 'package:affinity_destiny/component/chat/chatting_msg.dart';

class ChattingState {
  var isBottomMenuOpen = false.obs;
  var chattingMsgs = List<ChattingMsg>.empty().obs;
}
