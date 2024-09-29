import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/model/orm/user.dart';
import 'package:affinity_destiny/model/component/contact_block.dart';
import 'package:affinity_destiny/model/enumeration/contact_type.dart';
import 'package:affinity_destiny/model/component/menu_item.dart';
import 'package:affinity_destiny/shared/constant.dart';
import 'package:affinity_destiny/shared/util/lang.dart';

part 'package:affinity_destiny/data/contact_start_data.dart';

class ContactStartController extends GetxController {
  late ScrollController scrollController;

  final int index = 2;
  final String title = LangKey.navMenuContact.tr;

  var type = ContactType.alphabet.obs;
  var contactBlocks = <ContactBlock>[].obs;
  var selectedLetter = ''.obs;

  List<MenuItem> get menuItems => [
        MenuItem(
          title: LangKey.itemNewFriend.tr,
          icon: EvaIcons.personAddOutline,
          callback: () {},
          showBottomBorder: true,
        ),
        MenuItem(
          title: LangKey.itemGroupManager.tr,
          icon: EvaIcons.personOutline,
          callback: () {},
          showBottomBorder: true,
        ),
        MenuItem(
          title: LangKey.itemCategoryManager.tr,
          icon: EvaIcons.options2Outline,
          callback: () {},
          showBottomBorder: true,
        ),
      ];

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    contactBlocks.value = _initContactBlock(users);
  }

  List<String> getBlockNames(List<User> users) {
    List<String> names = [];
    if (type.value == ContactType.alphabet) {
      names = users
          .map((user) => LangUtil.processLanguage(
              user.nickname[0], LangUtil.detectLanguage(user.nickname[0])))
          .toSet()
          .toList();
      names.sort((a, b) {
        bool isASpecial = AppConstant.regSpecial.hasMatch(a);
        bool isBSpecial = AppConstant.regSpecial.hasMatch(b);
        if (isASpecial && isBSpecial) {
          return 1;
        } else if (isASpecial && !isBSpecial) {
          return 1;
        } else if (!isASpecial && isBSpecial) {
          return -1;
        } else {
          return a.compareTo(b);
        }
      });
    } else if (type.value == ContactType.custom) {
      names = users.map((user) => user.categoryName).toSet().toList();
      names.sort((a, b) {
        int starA =
            users.firstWhere((user) => user.categoryName == a).categoryStar;
        int starB =
            users.firstWhere((user) => user.categoryName == b).categoryStar;
        return starB.compareTo(starA);
      });

      // user star as block name to display because the width of category name is too long
      // List<int> intNames =
      //     users.map((user) => user.categoryStar).toSet().toList();
      // intNames.sort((a, b) => b.compareTo(a));

      // names = intNames.map((name) => name.toString()).toList();
    } else {
      throw Exception('Unknown contact type...');
    }

    return names;
  }

  void onChangeOrderBy() {
    type.value = type.value == ContactType.alphabet
        ? ContactType.custom
        : ContactType.alphabet;
    scrollController.jumpTo(0);
    contactBlocks.value = _initContactBlock(users);
  }

  void onSelectLetter(String letter) {
    selectedLetter.value = letter;

    // locate the users with the same first letter
    double userOffset = 0;
    for (int i = 0; i < contactBlocks.length; i++) {
      if (i > 0) {
        userOffset += contactBlocks[i - 1].users.length * 72;
      }
      if (contactBlocks[i].blockName.startsWith(letter)) {
        scrollController.animateTo(
          i * (16 + 16) + userOffset,
          duration: const Duration(microseconds: 1000),
          curve: Curves.easeInOut,
        );
        break;
      }
    }
  }

  List<ContactBlock> _initContactBlock(List<User> users) {
    List<ContactBlock> processedBlocks = [];
    List<String> blockNames = getBlockNames(users);
    if (type.value == ContactType.alphabet) {
      for (var name in blockNames) {
        List<User> blockUsers = users
            .where((user) =>
                name ==
                LangUtil.processLanguage(user.nickname[0],
                    LangUtil.detectLanguage(user.nickname[0])))
            .toList();
        processedBlocks.add(ContactBlock(blockName: name, users: blockUsers));
      }
      if (blockNames.contains(AppConstant.charSpecial)) {
        List<User> blockUsers = users
            .where((user) =>
                AppConstant.charSpecial ==
                LangUtil.processLanguage(user.nickname[0],
                    LangUtil.detectLanguage(user.nickname[0])))
            .toList();
        if (processedBlocks.lastOrNull?.blockName == AppConstant.charSpecial) {
          processedBlocks.lastOrNull?.users.clear();
          processedBlocks.lastOrNull?.users.addAll(blockUsers);
        }
      }
    } else if (type.value == ContactType.custom) {
      for (var name in blockNames) {
        List<User> blockUsers =
            users.where((user) => user.categoryName == name).toList();
        processedBlocks.add(ContactBlock(blockName: name, users: blockUsers));
      }

      // user star as block name to display because the width of category name is too long
      // for (var name in blockNames) {
      //   List<User> blockUsers = users
      //       .where((user) => user.categoryStar == int.parse(name))
      //       .toList();
      //   String categoryName = users
      //       .firstWhere((user) => user.categoryStar == int.parse(name))
      //       .categoryName;
      //   processedBlocks.add(ContactBlock(blockName: categoryName, users: blockUsers));
      // }
    } else {
      throw Exception('Unknown contact type...');
    }

    return processedBlocks;
  }
}
