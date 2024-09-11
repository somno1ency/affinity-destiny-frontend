import 'package:flutter/material.dart';

import '../../model/component/contact_block.dart';
import '../../model/orm/user.dart';

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
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: contactBlocks.length,
        itemBuilder: (context, groupIndex) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(contactBlocks[groupIndex].blockName),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: contactBlocks[groupIndex].users.length,
                itemBuilder: (context, contactIndex) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          contactBlocks[groupIndex].users[contactIndex].avatar),
                    ),
                    title: Text(
                        contactBlocks[groupIndex].users[contactIndex].nickname),
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
