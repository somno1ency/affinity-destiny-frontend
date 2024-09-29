import 'package:flutter/material.dart';

import 'package:affinity_destiny/model/enumeration/alignment_location.dart';
import 'package:affinity_destiny/shared/constant.dart';

class AlphabetSideBar extends StatelessWidget {
  final ValueChanged<String> callback;
  final List<String> _letters = [];
  final AlignmentLocation location;

  AlphabetSideBar({
    super.key,
    required this.callback,
    List<String>? letters,
    required this.location,
  }) {
    if (letters == null || letters.isEmpty) {
      for (int i = 0; i < 26; i++) {
        _letters.add(String.fromCharCode(65 + i));
      }
    } else {
      _letters.addAll(letters);
    }
  }

  MainAxisAlignment get currentLocation => switch (location) {
        AlignmentLocation.start => MainAxisAlignment.start,
        AlignmentLocation.center => MainAxisAlignment.center,
        AlignmentLocation.end => MainAxisAlignment.end,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 50),
      alignment: Alignment.center,
      width: 30,
      child: Column(
        mainAxisAlignment: currentLocation,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: _letters.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => callback(_letters[index]),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 2),
                  child: ClipOval(
                    child: Container(
                      width: 18,
                      height: 18,
                      color: AppConstant.colorTheme
                          .withOpacity(AppConstant.opacity1),
                      child: Center(
                        child: Text(
                          _letters[index][0],
                          style: AppConstant.textTheme.labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
