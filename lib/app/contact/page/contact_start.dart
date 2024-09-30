import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/app/contact/controller/contact_start.dart';
import 'package:affinity_destiny/app/shared/controller/shared.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/component/chat/alphabet_side_bar.dart';
import 'package:affinity_destiny/component/shared/app_bottom_bar.dart';
import 'package:affinity_destiny/component/shared/custom_input.dart';
import 'package:affinity_destiny/model/enumeration/contact_type.dart';
import 'package:affinity_destiny/model/enumeration/alignment_location.dart';
import 'package:affinity_destiny/shared/constant.dart';

class ContactStartPage extends GetView<ContactStartController> {
  const ContactStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> actionItems = [];
    for (var menu in controller.menuItems) {
      actionItems.add(
        Column(
          children: [
            ListTile(
              leading: Icon(menu.icon, size: 24, color: AppConstant.colorTheme),
              title: Text(
                menu.title,
                style: AppConstant.textThemePrimary.labelMedium!
                    .copyWith(color: AppConstant.colorMain),
              ),
              onTap: menu.callback,
            ),
            if (menu.showBottomBorder)
              Divider(
                height: 1,
                color: AppConstant.colorGrey.withOpacity(AppConstant.opacity1),
              ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppChatBar(
        title: controller.title,
        actions: [
          IconButton(
            icon: const Icon(EvaIcons.plusCircleOutline),
            color: AppConstant.colorWhite,
            iconSize: 24,
            onPressed: () {},
          ),
        ],
      ),
      body: Material(
        color: AppConstant.colorWhite.withOpacity(AppConstant.opacity95),
        child: Column(
          children: [
            CustomInput(
              color: AppConstant.colorTheme,
              hintText: LangKey.searchPlaceholder.tr,
              hintStyle: AppConstant.textThemePrimary.labelMedium!.copyWith(
                  color:
                      AppConstant.colorTheme.withOpacity(AppConstant.opacity5)),
              fontSize: 12,
              isCenter: false,
            ),
            ...actionItems,
            Expanded(
              child: Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        controller: controller.scrollController,
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
                                        controller.contactBlocks[blockIndex]
                                            .blockName,
                                        style: AppConstant
                                            .textThemePrimary.titleSmall!
                                            .copyWith(
                                                color: AppConstant.colorMain),
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: controller
                                          .contactBlocks[blockIndex]
                                          .users
                                          .length,
                                      itemBuilder: (context, userIndex) {
                                        return ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                controller
                                                    .contactBlocks[blockIndex]
                                                    .users[userIndex]
                                                    .avatar),
                                          ),
                                          title: Text(
                                            controller.contactBlocks[blockIndex]
                                                .users[userIndex].nickname,
                                            style: AppConstant
                                                .textThemePrimary.bodySmall!
                                                .copyWith(
                                                    color:
                                                        AppConstant.colorMain),
                                          ),
                                          subtitle: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 5),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: AppConstant.colorGrey
                                                      .withOpacity(
                                                          AppConstant.opacity1),
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              controller
                                                  .contactBlocks[blockIndex]
                                                  .users[userIndex]
                                                  .categoryName,
                                              style: AppConstant
                                                  .textThemePrimary.labelSmall!
                                                  .copyWith(
                                                      color: AppConstant
                                                          .colorSub2),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                              childCount: controller.contactBlocks.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AlphabetSideBar(
                      callback: controller.onSelectLetter,
                      letters: controller.getBlockNames(users),
                      location: AlignmentLocation.center,
                    ),
                  ],
                ),
              ),
            ),
            AppBottomBar(
              currentIndex: controller.index,
              callback: SharedController.to.navigateTo,
              menus: SharedController.to.navigationMenus,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 25, 45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(
              () => FloatingActionButton(
                onPressed: controller.onChangeOrderBy,
                shape: const CircleBorder(),
                tooltip: controller.type.value == ContactType.alphabet
                    ? LangKey.orderByCategory.tr
                    : LangKey.orderByAlphabet.tr,
                backgroundColor: AppConstant.colorTheme,
                child: controller.type.value == ContactType.alphabet
                    ? const Icon(EvaIcons.listOutline,
                        color: AppConstant.colorWhite)
                    : const Icon(Ionicons.text_outline,
                        color: AppConstant.colorWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
