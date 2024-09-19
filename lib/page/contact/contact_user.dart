import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';

import '../../model/orm/user.dart';
import '../../model/component/contact_block.dart';
import '../../model/router/contact_category.dart';
import '../../model/component/enumeration/contact_type.dart';
import '../../model/component/menu_item.dart';
import '../../model/router/navigation_args.dart';
import '../../model/router/navigation_title_args.dart';
import '../../model/component/enumeration/alignment_location.dart';
import '../../component/chat/app_chat_bar.dart';
import '../../component/chat/alphabet_side_bar.dart';
import '../../component/shared/custom_input.dart';
import '../../shared/constant.dart';
import '../../shared/util/lang_util.dart';

part '../../data/contact_user_data.dart';

class ContactUserPage extends StatefulWidget {
  final ContactCategory category;

  const ContactUserPage({
    super.key,
    required this.category,
  });

  @override
  State<ContactUserPage> createState() => _ContactUserPageState();
}

class _ContactUserPageState extends State<ContactUserPage> {
  late ScrollController _scrollController;
  String selectedLetter = '';
  List<ContactBlock> contactBlocks = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // init users data to category by alphabet
    contactBlocks = _initContactBlock(users);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = [
      MenuItem(
        title: AppLocalizations.of(context)!.item_newFriend,
        icon: EvaIcons.personAddOutline,
        callback: () {},
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.item_groupManager,
        icon: EvaIcons.personOutline,
        callback: () {},
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.item_categoryManager,
        icon: EvaIcons.options2Outline,
        callback: () {},
        showBottomBorder: true,
      ),
    ];
    List<Widget> actionItems = [];
    for (var menu in menuItems) {
      actionItems.add(
        Column(
          children: [
            ListTile(
              leading: Icon(menu.icon, size: 24, color: colorTheme),
              title: Text(
                menu.title,
                style: textThemePrimary.labelMedium!.copyWith(color: colorMain),
              ),
              onTap: menu.callback,
            ),
            if (menu.showBottomBorder)
              Divider(
                height: 1,
                color: colorGrey.withOpacity(opacity1),
              ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppChatBar(
        title: widget.category.titleArgs.topTitle,
        actions: [
          IconButton(
            icon: const Icon(EvaIcons.plusCircleOutline),
            color: colorWhite,
            iconSize: 24,
            onPressed: () {},
          ),
        ],
      ),
      body: Material(
        child: Column(
          children: [
            CustomInput(
              color: colorTheme,
              hintText: AppLocalizations.of(context)!.search_placeholder,
              hintStyle: textThemePrimary.labelMedium!
                  .copyWith(color: colorTheme.withOpacity(opacity5)),
              fontSize: 12,
              isCenter: false,
            ),
            ...actionItems,
            // ActionItem(
            //   text: AppLocalizations.of(context)!.item_newFriend,
            //   icon: EvaIcons.personAddOutline,
            //   iconColor: colorTheme,
            //   textStyle: textThemePrimary.labelMedium!.copyWith(color: colorMain),
            //   callback: () {},
            //   bottomBorder: true,
            // ),
            // ActionItem(
            //   text: AppLocalizations.of(context)!.item_groupManager,
            //   icon: EvaIcons.personOutline,
            //   iconColor: colorTheme,
            //   textStyle: textThemePrimary.labelMedium!.copyWith(color: colorMain),
            //   callback: () {},
            //   bottomBorder: true,
            // ),
            // ActionItem(
            //   text: AppLocalizations.of(context)!.item_categoryManager,
            //   icon: EvaIcons.options2Outline,
            //   iconColor: colorTheme,
            //   textStyle: textThemePrimary.labelMedium!.copyWith(color: colorMain),
            //   callback: () {},
            //   bottomBorder: true,
            // ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, blockIndex) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 16, 16, 0),
                                    child: Text(
                                      contactBlocks[blockIndex].blockName,
                                      style: textThemePrimary.titleSmall!
                                          .copyWith(color: colorMain),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        contactBlocks[blockIndex].users.length,
                                    itemBuilder: (context, userIndex) {
                                      return ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              contactBlocks[blockIndex]
                                                  .users[userIndex]
                                                  .avatar),
                                        ),
                                        title: Text(
                                          contactBlocks[blockIndex]
                                              .users[userIndex]
                                              .nickname,
                                          style: textThemePrimary.bodySmall!
                                              .copyWith(color: colorMain),
                                        ),
                                        subtitle: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 5),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: colorGrey
                                                    .withOpacity(opacity1),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            contactBlocks[blockIndex]
                                                .users[userIndex]
                                                .categoryName,
                                            style: textThemePrimary.labelSmall!
                                                .copyWith(color: colorSub2),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                            childCount: contactBlocks.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AlphabetSideBar(
                    callback: _selectLetter,
                    letters: _getBlockNames(users),
                    location: AlignmentLocation.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _changeOrderBy,
            shape: const CircleBorder(),
            tooltip: widget.category.type == ContactType.alphabet
                ? AppLocalizations.of(context)!.order_byCategory
                : AppLocalizations.of(context)!.order_byAlphabet,
            backgroundColor: colorTheme,
            child: widget.category.type == ContactType.alphabet
                ? const Icon(EvaIcons.listOutline, color: colorWhite)
                : const Icon(Ionicons.text_outline, color: colorWhite),
          ),
        ],
      ),
    );
  }

  void _changeOrderBy() {
    ContactType newType = widget.category.type == ContactType.alphabet
        ? ContactType.custom
        : ContactType.alphabet;
    ContactCategory category = ContactCategory(
      titleArgs: widget.category.titleArgs,
      type: newType,
    );
    Navigator.of(context).pushNamed(
      routerMain,
      arguments: NavigationArgs(
        index: 2,
        args0: NavigationTitleArgs(
          topTitle: AppLocalizations.of(context)!.navMenu_singleChatBlanked,
          bottomTitle: AppLocalizations.of(context)!.navMenu_singleChat,
        ),
        args1: NavigationTitleArgs(
          topTitle: AppLocalizations.of(context)!.navMenu_groupChatBlanked,
          bottomTitle: AppLocalizations.of(context)!.navMenu_groupChat,
        ),
        args2: category,
        args3: NavigationTitleArgs(
          topTitle: AppLocalizations.of(context)!.navMenu_discoveryBlanked,
          bottomTitle: AppLocalizations.of(context)!.navMenu_discovery,
        ),
        args4: NavigationTitleArgs(
          topTitle: AppLocalizations.of(context)!.navMenu_accountBlanked,
          bottomTitle: AppLocalizations.of(context)!.navMenu_account,
        ),
      ),
    );
  }

  void _selectLetter(String letter) {
    setState(() {
      selectedLetter = letter;
    });

    // locate the users with the same first letter
    double userOffset = 0;
    for (int i = 0; i < contactBlocks.length; i++) {
      if (i > 0) {
        userOffset += contactBlocks[i - 1].users.length * 72;
      }
      if (contactBlocks[i].blockName.startsWith(letter)) {
        _scrollController.animateTo(
          i * (16 + 16) + userOffset,
          duration: const Duration(microseconds: 1000),
          curve: Curves.easeInOut,
        );
        break;
      }
    }
  }

  List<String> _getBlockNames(List<User> users) {
    List<String> names = [];
    if (widget.category.type == ContactType.alphabet) {
      names = users
          .map((user) => LangUtil.processLanguage(
              user.nickname[0], LangUtil.detectLanguage(user.nickname[0])))
          .toSet()
          .toList();
      names.sort((a, b) {
        bool isASpecial = regSpecial.hasMatch(a);
        bool isBSpecial = regSpecial.hasMatch(b);
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
    } else if (widget.category.type == ContactType.custom) {
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

  List<ContactBlock> _initContactBlock(List<User> users) {
    List<ContactBlock> processedBlocks = [];
    List<String> blockNames = _getBlockNames(users);
    if (widget.category.type == ContactType.alphabet) {
      for (var name in blockNames) {
        List<User> blockUsers = users
            .where((user) =>
                name ==
                LangUtil.processLanguage(user.nickname[0],
                    LangUtil.detectLanguage(user.nickname[0])))
            .toList();
        processedBlocks.add(ContactBlock(blockName: name, users: blockUsers));
      }
      if (blockNames.contains(charSpecial)) {
        List<User> blockUsers = users
            .where((user) =>
                charSpecial ==
                LangUtil.processLanguage(user.nickname[0],
                    LangUtil.detectLanguage(user.nickname[0])))
            .toList();
        if (processedBlocks.lastOrNull?.blockName == charSpecial) {
          processedBlocks.lastOrNull?.users.clear();
          processedBlocks.lastOrNull?.users.addAll(blockUsers);
        }
      }
    } else if (widget.category.type == ContactType.custom) {
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
