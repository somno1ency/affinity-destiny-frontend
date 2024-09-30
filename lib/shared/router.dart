import 'package:get/get.dart';

import 'package:affinity_destiny/app/start/controller/authentication_processor.dart';
import 'package:affinity_destiny/app/chat/controller/chat_start.dart';
import 'package:affinity_destiny/app/chat/controller/chatting.dart';
import 'package:affinity_destiny/app/chat/controller/chat_info.dart';
import 'package:affinity_destiny/app/group/controller/group_chat_start.dart';
import 'package:affinity_destiny/app/group/controller/group_chatting.dart';
import 'package:affinity_destiny/app/group/controller/group_chat_info.dart';
import 'package:affinity_destiny/app/group/controller/group_chat_setting_processor.dart';
import 'package:affinity_destiny/app/contact/controller/contact_start.dart';
import 'package:affinity_destiny/app/discover/controller/discover_start.dart';
import 'package:affinity_destiny/app/profile/controller/profile_start.dart';
import 'package:affinity_destiny/app/profile/controller/setting.dart';
import 'package:affinity_destiny/app/shared/controller/background_processor.dart';

import 'package:affinity_destiny/app/start/page/app_start.dart';
import 'package:affinity_destiny/app/start/page/register_start.dart';
import 'package:affinity_destiny/app/start/page/register_code.dart';
import 'package:affinity_destiny/app/start/page/login_by_phone.dart';
import 'package:affinity_destiny/app/start/page/login_by_password.dart';
import 'package:affinity_destiny/app/start/page/login_code.dart';
import 'package:affinity_destiny/app/chat/page/chat_start.dart';
import 'package:affinity_destiny/app/chat/page/chatting.dart';
import 'package:affinity_destiny/app/chat/page/chat_info.dart';
import 'package:affinity_destiny/app/group/page/group_chat_start.dart';
import 'package:affinity_destiny/app/group/page/group_chatting.dart';
import 'package:affinity_destiny/app/group/page/group_chat_info.dart';
import 'package:affinity_destiny/app/group/page/group_chat_member_info.dart';
import 'package:affinity_destiny/app/group/page/group_chat_qr_code.dart';
import 'package:affinity_destiny/app/group/page/group_chat_set_name.dart';
import 'package:affinity_destiny/app/group/page/group_chat_set_remark.dart';
import 'package:affinity_destiny/app/group/page/group_chat_set_nickname.dart';
import 'package:affinity_destiny/app/contact/page/contact_start.dart';
import 'package:affinity_destiny/app/discover/page/discover_start.dart';
import 'package:affinity_destiny/app/profile/page/profile_start.dart';
import 'package:affinity_destiny/app/profile/page/setting.dart';
import 'package:affinity_destiny/app/shared/page/set_background_way.dart';
import 'package:affinity_destiny/app/shared/page/choose_background.dart';

class AppRouter {
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

  // 6.profile pages
  static const String profileStart = '/profileStart';
  static const String setting = '/setting';

  // 7.shared pages
  static const String setBackgroundWay = '/setBackGroundWay';
  static const String chooseBackground = '/chooseBackground';

  static final List<GetPage> routers = [
    // 1.start pages
    GetPage(
      name: appStart,
      page: () => const AppStartPage(),
      binding: BindingsBuilder(() {
        Get.put(AuthenticationProcessorController());
      }),
    ),
    GetPage(
      name: registerStart,
      page: () => const RegisterStartPage(),
      binding: BindingsBuilder(() {
        Get.put(AuthenticationProcessorController());
      }),
    ),
    GetPage(
      name: registerCode,
      page: () => const RegisterCodePage(),
      binding: BindingsBuilder(() {
        Get.put(AuthenticationProcessorController());
      }),
    ),
    GetPage(
      name: loginByPhone,
      page: () => const LoginByPhonePage(),
      binding: BindingsBuilder(() {
        Get.put(AuthenticationProcessorController());
      }),
    ),
    GetPage(
      name: loginByPassword,
      page: () => const LoginByPasswordPage(),
      binding: BindingsBuilder(() {
        Get.put(AuthenticationProcessorController());
      }),
    ),
    GetPage(
      name: loginCode,
      page: () => const LoginCodePage(),
      binding: BindingsBuilder(() {
        Get.put(AuthenticationProcessorController());
      }),
    ),

    // 2.single chat pages
    GetPage(
      name: chatStart,
      page: () => const ChatStartPage(),
      binding: BindingsBuilder(() {
        Get.put(ChatStartController());
      }),
    ),
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

    // 3.group chat pages
    GetPage(
      name: groupChatStart,
      page: () => const GroupChatStartPage(),
      binding: BindingsBuilder(() {
        Get.put(GroupChatStartController());
      }),
    ),
    GetPage(
      name: groupChatting,
      page: () => const GroupChattingPage(),
      binding: BindingsBuilder(() {
        Get.put(GroupChattingController());
      }),
    ),
    GetPage(
      name: groupChatInfo,
      page: () => const GroupChatInfoPage(),
      binding: BindingsBuilder(() {
        Get.put(GroupChatInfoController());
      }),
    ),
    GetPage(
      name: groupChatMemberInfo,
      page: () => const GroupChatMemberInfoPage(),
      binding: BindingsBuilder(() {
        Get.put(GroupChatSettingProcessorController());
      }),
    ),
    GetPage(
      name: groupChatQrCode,
      page: () => const GroupChatQrCodePage(),
      binding: BindingsBuilder(() {
        Get.put(GroupChatSettingProcessorController());
      }),
    ),
    GetPage(
      name: groupChatSetName,
      page: () => const GroupChatSetNamePage(),
      binding: BindingsBuilder(() {
        Get.put(GroupChatSettingProcessorController());
      }),
    ),
    GetPage(
      name: groupChatSetNickname,
      page: () => const GroupChatSetNicknamePage(),
      binding: BindingsBuilder(() {
        Get.put(GroupChatSettingProcessorController());
      }),
    ),
    GetPage(
      name: groupChatSetRemark,
      page: () => const GroupChatSetRemarkPage(),
      binding: BindingsBuilder(() {
        Get.put(GroupChatSettingProcessorController());
      }),
    ),

    // 4.contact pages
    GetPage(
      name: contactStart,
      page: () => const ContactStartPage(),
      binding: BindingsBuilder(() {
        Get.put(ContactStartController());
      }),
    ),

    // 5.discover pages
    GetPage(
      name: discoverStart,
      page: () => const DiscoverStartPage(),
      binding: BindingsBuilder(() {
        Get.put(DiscoverStartController());
      }),
    ),

    // 6.profile pages
    GetPage(
      name: profileStart,
      page: () => const ProfileStartPage(),
      binding: BindingsBuilder(() {
        Get.put(ProfileStartController());
      }),
    ),
    GetPage(
      name: setting,
      page: () => const SettingPage(),
      binding: BindingsBuilder(() {
        Get.put(SettingController());
      }),
    ),

    // 7.shared pages
    GetPage(
      name: setBackgroundWay,
      page: () => const SetBackgroundWayPage(),
      binding: BindingsBuilder(() {
        Get.put(BackgroundProcessorController());
      }),
    ),
    GetPage(
      name: chooseBackground,
      page: () => const ChooseBackgroundPage(),
      binding: BindingsBuilder(() {
        Get.put(BackgroundProcessorController());
      }),
    ),
  ];

  AppRouter._();
}
