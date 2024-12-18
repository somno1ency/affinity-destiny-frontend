// 1.app level definition
import 'package:flutter/material.dart';

const bool appLogin = true;

// 2.router named definition
const String routerStart = 'start';
const String routerMain = 'main';
const String routerRegisterStart = 'registerStart';
const String routerRegisterCode = 'registerCode';
const String routerLoginByPhone = 'loginByPhone';
const String routerLoginCode = 'loginCode';
const String routerLoginByPassword = 'loginByPassword';
const String routerSingleChat = 'singleChat';
const String routerSingleDetail = 'singleDetail';
const String routerSingleSearch = 'singleSearch';
const String routerGroupChat = 'groupChat';
const String routerGroupDetail = 'groupDetail';
const String routerGroupMemberDetail = 'groupMemberDetail';
const String routerGroupSetName = "groupSetName";
const String routerGroupQrCode = "groupQrCode";
const String routerGroupSetRemark = "groupSetRemark";
const String routerGroupSetNickname = "groupSetNickname";
const String routerSetBackgroundWay = 'setBackGroundWay';
const String routerChooseBackground = 'chooseBackground';
const String routerSetting = 'setting';

// 3.color definition
const Color colorTheme = Colors.teal;
const Color colorMain = Color(0xFF333333);
const Color colorSub1 = Color(0xFF666666);
const Color colorSub2 = Color(0xFF999999);
const Color colorMyMsg = Color(0xff96EC6D);
const Color colorYourMsg = Colors.white;
const Color colorChatSub = Color(0xff969696);
const Color colorWhite = Colors.white;
const Color colorBlack = Colors.black;
const Color colorGrey = Colors.grey;
const Color colorRed = Colors.red;
const Color colorTransparent = Colors.transparent;

// 3.opacity definition
const double opacity1 = 0.1;
const double opacity2 = 0.2;
const double opacity3 = 0.3;
const double opacity4 = 0.4;
const double opacity5 = 0.5;
const double opacity6 = 0.6;
const double opacity7 = 0.7;
const double opacity8 = 0.8;
const double opacity9 = 0.9;
const double opacity95 = 0.95;

// 4.alphabetical definition
const Set<String> setAlphabetical = {
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
const String charSpecial = '#';

// 5.regexp definition
final regChinese = RegExp(r'[\u4e00-\u9fa5]');
final regEnglish = RegExp(r'[a-zA-Z]');
final regSpecial = RegExp(r'[^a-zA-Z\u4e00-\u9fa5]');

// 6.text theme definition
const TextTheme textThemePrimary = TextTheme(
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
const TextTheme textTheme = TextTheme(
  labelMedium: TextStyle(
    fontFamily: 'Consolas',
    fontSize: 24,
    height: 1,
  ),
);

// N.others definition
const String cnPhonePrefix = '+86';
