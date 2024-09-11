import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';

import '../../model/component/contact_block.dart';
import '../../model/orm/user.dart';
import '../../component/chat/app_chat_bar.dart';
import '../../shared/constant.dart';

part '../../data/contact_user_data.dart';

class ContactUserPage extends StatelessWidget {
  final String title;

  const ContactUserPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title: title,
        actions: [
          IconButton(
            icon: const Icon(EvaIcons.plusCircleOutline),
            color: colorWhite,
            iconSize: 24,
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contactBlocks.length,
        itemBuilder: (context, blockIndex) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
                child: Text(contactBlocks[blockIndex].blockName),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: contactBlocks[blockIndex].users.length,
                itemBuilder: (context, userIndex) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          contactBlocks[blockIndex].users[userIndex].avatar),
                    ),
                    title: Text(
                      contactBlocks[blockIndex].users[userIndex].nickname,
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                    ),
                    subtitle: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: colorGrey.withOpacity(opacity1),
                          ),
                        ),
                      ),
                      child: Text('分组名称',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .labelSmall!
                              .copyWith(color: colorGrey)),
                    ),
                    // shape: Border(bottom: BorderSide(color: colorGrey)),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
