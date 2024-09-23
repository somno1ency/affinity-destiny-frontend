import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../component/chat/app_chat_bar.dart';
import '../../../model/orm/group.dart';
import '../../../shared/constant.dart';

class GroupRemarkPage extends StatelessWidget {
  final Group group;

  const GroupRemarkPage({
    super.key,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.width * 0.8;
    double subWidth = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      appBar: AppChatBar(
        title: AppLocalizations.of(context)!.group_remark,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AppLocalizations.of(context)!.group_modifyRemarkTips,
                  style: textThemePrimary.bodySmall!.copyWith(color: colorMain),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Container(
                    height: 50,
                    width: mainWidth,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: colorSub1.withOpacity(opacity1),
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: colorSub1.withOpacity(opacity1),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                              'assets/images/avatar/avatar_001.webp'),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: subWidth,
                          child: TextField(
                            cursorColor: colorTheme,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: group.name,
                              hintStyle: textThemePrimary.labelMedium!
                                  .copyWith(color: colorSub2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    side: const BorderSide(
                      color: colorTheme,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.system_ok,
                    style: textThemePrimary.labelMedium!
                        .copyWith(color: colorTheme),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
