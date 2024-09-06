part of '../main.dart';

Map<String, WidgetBuilder> get routeMap => {
      routerStart: (context) => const AppStart(),
      routerMain: (context) => const AppNavigation(),
      routerRegisterStart: (context) => const RegisterPage(),
      routerRegisterCode: (context) => const RegisterCodePage(),
      routerLoginByPhone: (context) => const AppNavigation(),
      routerLoginCode: (context) => const AppNavigation(),
      routerLoginByPassword: (context) => const AppNavigation(),
      routerSingleChatList: (context) => const AppNavigation(),
      routerSingleChat: (context) => const AppNavigation(),
      routerSingleDetail: (context) => const AppNavigation(),
      routerSingleSearch: (context) => const AppNavigation(),
      routerGroupChatList: (context) => const AppNavigation(),
      routerGroupDetail: (context) => const AppNavigation(),
      routerGroupMemberDetail: (context) => const AppNavigation(),
      routerContact: (context) => const AppNavigation(),
      routerSetBackground: (context) => const AppNavigation(),
    };
