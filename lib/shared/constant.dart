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
const String routerSetBackground = 'setBackGround';

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
