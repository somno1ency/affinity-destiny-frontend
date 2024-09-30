import 'package:get/get.dart';

import 'package:affinity_destiny/model/router/group_chat_start.dart';

class GroupChatSettingProcessorController extends GetxController {
  late GroupChatStartArgs args;

  @override
  void onInit() {
    super.onInit();
    args = Get.arguments as GroupChatStartArgs;
  }
}
