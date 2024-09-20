import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../component/chat/app_chat_bar.dart';
import '../../../model/orm/group.dart';
import '../../../shared/constant.dart';

class GroupQrCodePage extends StatelessWidget {
  final Group group;

  const GroupQrCodePage({
    super.key,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title: AppLocalizations.of(context)!.group_qrCode,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/images/avatar/avatar_001.webp'),
                ),
                const SizedBox(height: 10),
                Text(
                  '${AppLocalizations.of(context)!.navMenu_groupChat}: ${group.name}',
                  style: textThemePrimary.bodySmall!.copyWith(
                    color: colorSub1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 220,
                  width: 220,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/qrcode.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  AppLocalizations.of(context)!
                      .group_modifyQrCodeTips('9月27日前'),
                  style: textThemePrimary.labelMedium!.copyWith(
                    color: colorSub1.withOpacity(opacity6),
                  ),
                ),
              ],
            ),
          ),
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
              AppLocalizations.of(context)!.system_savePicture,
              style: textThemePrimary.labelMedium!.copyWith(color: colorTheme),
            ),
          ),
        ],
      ),
    );
  }
}
