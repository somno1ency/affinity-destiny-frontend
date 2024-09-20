import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../component/chat/app_chat_bar.dart';
import '../../../component/shared/custom_input.dart';
import '../../../model/orm/user.dart';
import '../../../shared/util/build_util.dart';
import '../../../shared/constant.dart';

class GroupMemberPage extends StatelessWidget {
  final List<User> users;

  const GroupMemberPage({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title:
            '${AppLocalizations.of(context)!.group_viewAllMember} (${users.length})',
        leading: IconButton(
          icon: const Icon(
            Ionicons.arrow_undo_outline,
            size: 24,
          ),
          color: colorWhite,
          onPressed: () {
            Navigator.of(context).pop();
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
              color: colorTheme,
              hintText: AppLocalizations.of(context)!.search_placeholder,
              hintStyle: textThemePrimary.labelMedium!
                  .copyWith(color: colorTheme.withOpacity(opacity5)),
              fontSize: 12,
              isCenter: false,
            ),
            Container(
              height: 10,
              color: colorWhite,
            ),
            BuildUtil.buildPhotoGallery(users, 0),
          ],
        ),
      ),
    );
  }
}
