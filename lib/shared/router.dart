import 'package:get/get.dart';

import 'package:affinity_destiny/app/chat/controller/chat_start.dart';
import 'package:affinity_destiny/app/group/controller/group_chat_start.dart';
import 'package:affinity_destiny/app/contact/controller/contact_start.dart';
import 'package:affinity_destiny/app/discover/controller/discover_start.dart';
import 'package:affinity_destiny/app/profile/controller/profile_start.dart';
import 'package:affinity_destiny/app/chat/controller/chat_info.dart';
import 'package:affinity_destiny/app/chat/controller/chatting.dart';

import 'package:affinity_destiny/app/chat/page/chat_start.dart';
import 'package:affinity_destiny/app/group/page/group_chat_start.dart';
import 'package:affinity_destiny/app/contact/page/contact_start.dart';
import 'package:affinity_destiny/app/discover/page/discover_start.dart';
import 'package:affinity_destiny/app/profile/page/profile_start.dart';
import 'package:affinity_destiny/app/start/page/app_start.dart';
import 'package:affinity_destiny/app/start/page/register_start.dart';
import 'package:affinity_destiny/app/start/page/register_code.dart';
import 'package:affinity_destiny/app/start/page/login_by_phone.dart';
import 'package:affinity_destiny/app/start/page/login_code.dart';
import 'package:affinity_destiny/app/start/page/login_by_password.dart';
import 'package:affinity_destiny/app/chat/page/chatting.dart';
import 'package:affinity_destiny/app/chat/page/chat_info.dart';
import 'package:affinity_destiny/app/group/page/group_chatting.dart';
import 'package:affinity_destiny/app/group/page/group_chat_info.dart';
import 'package:affinity_destiny/app/group/page/group_chat_member_info.dart';
import 'package:affinity_destiny/app/group/page/group_chat_set_name.dart';
import 'package:affinity_destiny/app/group/page/group_chat_qr_code.dart';
import 'package:affinity_destiny/app/group/page/group_chat_set_remark.dart';
import 'package:affinity_destiny/app/group/page/group_chat_set_nickname.dart';
import 'package:affinity_destiny/app/profile/page/setting.dart';
import 'package:affinity_destiny/app/shared/page/set_background_way.dart';
import 'package:affinity_destiny/app/shared/page/choose_background.dart';

class AppRouter {
  AppRouter._();

  // 1.start pages
  static const String appStart = '/appStart';
  static const String registerStart = '/registerStart';
  static const String registerCode = '/registerCode';
  static const String loginByPhone = '/loginByPhone';
  static const String loginByPassword = '/loginByPassword';
  static const String loginCode = '/loginCode';

  // 2.single chat pages
  static const String chatStart = '/chatStart';
  static const String chatting = '/chatting';
  static const String chatInfo = '/chatInfo';

  // 3.group chat pages
  static const String groupChatStart = '/groupChatStart';
  static const String groupChatting = '/groupChatting';
  static const String groupChatInfo = '/groupChatInfo';
  static const String groupChatMemberInfo = '/groupChatMemberInfo';
  static const String groupChatQrCode = '/groupChatQrCode';
  static const String groupChatSetName = '/groupChatSetName';
  static const String groupChatSetRemark = '/groupChatSetRemark';
  static const String groupChatSetNickname = '/groupChatSetNickname';

  // 4.contact pages
  static const String contactStart = '/contactStart';

  // 5.discover pages
  static const String discoverStart = '/discoverStart';

  // 6.me pages
  static const String profileStart = '/meStart';

  // 7.shared pages
  static const String setBackgroundWay = '/setBackGroundWay';
  static const String chooseBackground = '/chooseBackground';
  static const String setting = '/setting';

  static final List<GetPage> routers = [
    // 1.main navigation pages
    GetPage(
      name: chatStart,
      page: () => const ChatStartPage(),
      binding: BindingsBuilder(() {
        Get.put(ChatStartController());
      }),
    ),
    GetPage(
      name: groupChatStart,
      page: () => const GroupChatStartPage(),
      binding: BindingsBuilder(() {
        Get.put(GroupChatStartController());
      }),
    ),
    GetPage(
      name: contactStart,
      page: () => const ContactStartPage(),
      binding: BindingsBuilder(() {
        Get.put(ContactStartController());
      }),
    ),
    GetPage(
      name: discoverStart,
      page: () => const DiscoverStartPage(),
      binding: BindingsBuilder(() {
        Get.put(DiscoverStartController());
      }),
    ),
    GetPage(
      name: profileStart,
      page: () => const ProfileStartPage(),
      binding: BindingsBuilder(() {
        Get.put(ProfileStartController());
      }),
    ),

    // 2.start pages
    GetPage(
      name: appStart,
      page: () => const AppStartPage(),
    ),
    GetPage(
      name: registerStart,
      page: () => const RegisterStartPage(),
    ),
    GetPage(
      name: registerCode,
      page: () => const RegisterCodePage(),
    ),
    GetPage(
      name: loginByPhone,
      page: () => const LoginByPhonePage(),
    ),
    GetPage(
      name: loginCode,
      page: () => const LoginCodePage(),
    ),
    GetPage(
      name: loginByPassword,
      page: () => const LoginByPasswordPage(),
    ),

    // 3.single chat pages
    GetPage(
      name: chatting,
      page: () => const ChattingPage(),
      binding: BindingsBuilder(() {
        Get.put(ChattingController());
      }),
    ),
    GetPage(
      name: chatInfo,
      page: () => const ChatInfoPage(),
      binding: BindingsBuilder(() {
        Get.put(ChatInfoController());
      }),
    ),

    // 4.group chat pages
    // GetPage(
    //   name: routerGroupChatting,
    //   page: () => const GroupChattingPage(),
    //   binding: BindingsBuilder(() {
    //     Get.put(GroupChattingController());
    //   }),
    // ),
    // GetPage(
    //   name: routerGroupChatInfo,
    //   page: () => const GroupChatInfoPage(),
    //   binding: BindingsBuilder(() {
    //     Get.put(GroupChatInfoController());
    //   }),
    // ),
    // GetPage(
    //   name: routerGroupChatMemberInfo,
    //   page: () => const GroupChatMemberInfoPage(),
    //   binding: BindingsBuilder(() {
    //     Get.put(GroupChatMemberInfoController());
    //   }),
    // ),
    // GetPage(
    //   name: routerGroupChatQrCode,
    //   page: () => const GroupChatQrCodePage(),
    //   binding: BindingsBuilder(() {
    //     Get.put(GroupChatQrCodeController());
    //   }),
    // ),
    // GetPage(
    //   name: routerGroupChatSetName,
    //   page: () => const GroupChatSetNamePage(),
    //   binding: BindingsBuilder(() {
    //     Get.put(GroupChatSetNameController());
    //   }),
    // ),
    // GetPage(
    //   name: routerGroupChatSetRemark,
    //   page: () => const GroupChatSetRemarkPage(),
    //   binding: BindingsBuilder(() {
    //     Get.put(GroupChatSetRemarkController());
    //   }),
    // ),
    // GetPage(
    //   name: routerGroupChatSetNickname,
    //   page: () => const GroupChatSetNicknamePage(),
    //   binding: BindingsBuilder(() {
    //     Get.put(GroupChatSetNicknameController());
    //   }),
    // ),

    // const String routerGroupChatting = '/groupChatting';
    // const String routerGroupChatInfo = '/groupChatInfo';
    // const String routerGroupChatMemberInfo = '/groupChatMemberInfo';
    // const String routerGroupChatQrCode = '/groupChatQrCode';
    // const String routerGroupChatSetName = '/groupChatSetName';
    // const String routerGroupChatSetRemark = '/groupChatSetRemark';
    // const String routerGroupChatSetNickname = '/groupChatSetNickname';

    // GetPage(name: routerSingleChat, page: () => ChatPage()),
    // GetPage(name: routerSingleDetail, page: () => ChatInfoPage()),
    // GetPage(name: routerGroupChat, page: () => GroupPage()),
    // GetPage(name: routerGroupDetail, page: () => GroupInfoPage()),
    // GetPage(name: routerGroupMemberDetail, page: () => GroupMemberPage()),
    // GetPage(name: routerGroupSetName, page: () => GroupNamePage()),
    // GetPage(name: routerGroupQrCode, page: () => GroupQrCodePage()),
    // GetPage(name: routerGroupSetRemark, page: () => GroupRemarkPage()),
    // GetPage(name: routerGroupSetNickname, page: () => GroupNicknamePage()),
    // GetPage(name: routerSetBackgroundWay, page: () => SetBackgroundWayPage()),
    // GetPage(name: routerChooseBackground, page: () => ChooseBackgroundPage()),
    // GetPage(name: routerSetting, page: () => SettingPage()),
  ];
}
