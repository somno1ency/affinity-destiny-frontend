import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/model/component/navigation_menu.dart';
import 'package:affinity_destiny/model/orm/user.dart';
import 'package:affinity_destiny/shared/router.dart';

class SharedController extends GetxController {
  static SharedController get to => Get.find();

  final List<NavigationMenu> navigationMenus = [
    NavigationMenu(
      label: LangKey.navMenuSingleChat.tr,
      icon: Ionicons.chatbubble_ellipses_outline,
      activeIcon: Ionicons.chatbubble_ellipses,
    ),
    NavigationMenu(
      label: LangKey.navMenuGroupChat.tr,
      icon: Ionicons.chatbubbles_outline,
      activeIcon: Ionicons.chatbubbles,
    ),
    NavigationMenu(
      label: LangKey.navMenuContact.tr,
      icon: Ionicons.at_outline,
      activeIcon: Ionicons.at,
    ),
    NavigationMenu(
      label: LangKey.navMenuDiscovery.tr,
      icon: Ionicons.aperture_outline,
      activeIcon: Ionicons.aperture,
    ),
    NavigationMenu(
      label: LangKey.navMenuAccount.tr,
      icon: Ionicons.person_outline,
      activeIcon: Ionicons.person,
    ),
  ];

  User get currentUser => const User(
        id: 1,
        mobile: '19918900255',
        avatar: 'assets/images/avatar/avatar_001.webp',
        sex: 1,
        nickname: '叶落无痕',
      );

  void navigateTo(int index) {
    switch (index) {
      case 0:
        Get.offAllNamed(AppRouter.chatStart);
        break;
      case 1:
        Get.offAllNamed(AppRouter.groupChatStart);
        break;
      case 2:
        Get.offAllNamed(AppRouter.contactStart);
        break;
      case 3:
        Get.offAllNamed(AppRouter.discoverStart);
        break;
      case 4:
        Get.offAllNamed(AppRouter.profileStart);
        break;
    }
  }
}
