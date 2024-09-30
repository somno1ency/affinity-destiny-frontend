import 'package:flutter/material.dart';

class AppConstant {
  // 1.app level definition
  static const bool appLogin = true;

  // 2.color definition
  static const Color colorTheme = Colors.teal;
  static const Color colorMain = Color(0xFF333333);
  static const Color colorSub1 = Color(0xFF666666);
  static const Color colorSub2 = Color(0xFF999999);
  static const Color colorMyMsg = Color(0xff96EC6D);
  static const Color colorYourMsg = Colors.white;
  static const Color colorChatSub = Color(0xff969696);
  static const Color colorWhite = Colors.white;
  static const Color colorBlack = Colors.black;
  static const Color colorGrey = Colors.grey;
  static const Color colorRed = Colors.red;
  static const Color colorTransparent = Colors.transparent;

  // 3.opacity definition
  static const double opacity1 = 0.1;
  static const double opacity2 = 0.2;
  static const double opacity3 = 0.3;
  static const double opacity4 = 0.4;
  static const double opacity5 = 0.5;
  static const double opacity6 = 0.6;
  static const double opacity7 = 0.7;
  static const double opacity8 = 0.8;
  static const double opacity9 = 0.9;
  static const double opacity95 = 0.95;

  // 4.alphabetical definition
  static const Set<String> setAlphabetical = {
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  };
  static const String charSpecial = '#';

  // 5.regexp definition
  static final regChinese = RegExp(r'[\u4e00-\u9fa5]');
  static final regEnglish = RegExp(r'[a-zA-Z]');
  static final regSpecial = RegExp(r'[^a-zA-Z\u4e00-\u9fa5]');

  // 6.text theme definition
  static const TextTheme textThemePrimary = TextTheme(
    titleMedium: TextStyle(
      fontSize: 20,
      fontFamily: 'Consolas',
      height: 1,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontFamily: 'Consolas',
      height: 1,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Consolas',
      fontSize: 25,
      height: 1,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Consolas',
      fontSize: 14,
      height: 1,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Consolas',
      fontSize: 28,
      height: 1,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Consolas',
      fontSize: 12,
      height: 1,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Consolas',
      fontSize: 10,
      height: 1,
    ),
  );
  static const TextTheme textTheme = TextTheme(
    labelMedium: TextStyle(
      fontFamily: 'Consolas',
      fontSize: 24,
      height: 1,
    ),
  );

  // N.others definition
  static const String cnPhonePrefix = '+86';

  AppConstant._();
}
