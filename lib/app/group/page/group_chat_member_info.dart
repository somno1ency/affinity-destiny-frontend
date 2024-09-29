import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/component/chat/app_chat_bar.dart';
import 'package:affinity_destiny/component/shared/custom_input.dart';
import 'package:affinity_destiny/model/orm/user.dart';
import 'package:affinity_destiny/shared/util/build.dart';
import 'package:affinity_destiny/shared/constant.dart';

class GroupChatMemberInfoPage extends StatelessWidget {
  final List<User> users;

  const GroupChatMemberInfoPage({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title: '${LangKey.groupViewAllMember.tr} (${users.length})',
        leading: IconButton(
          icon: const Icon(
            Ionicons.arrow_undo_outline,
            size: 24,
          ),
          color: AppConstant.colorWhite,
          onPressed: () {
            Get.back();
          },
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Container(
              height: 10,
              color: AppConstant.colorWhite,
            ),
            BuildUtil.buildPhotoGallery(users, 0),
          ],
        ),
      ),
    );
  }
}
