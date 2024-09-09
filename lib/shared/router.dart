part of '../main.dart';

Map<String, WidgetBuilder> get routeMap => {
      routerStart: (context) => const AppStartPage(),
      routerMain: (context) => const AppNavigationPage(index: 0),
      routerRegisterStart: (context) => const RegisterPage(),
      routerRegisterCode: (context) => const RegisterCodePage(),
      routerLoginByPhone: (context) => const LoginByPhonePage(),
      routerLoginCode: (context) => const LoginCodePage(),
      routerLoginByPassword: (context) => const LoginByPasswordPage(),
      routerSingleChatList: (context) => const AppNavigationPage(index: 0),
      routerSingleChat: (context) => const ChatPage(),
      routerSingleDetail: (context) => const AppNavigationPage(),
      routerSingleSearch: (context) => const AppNavigationPage(),
      routerGroupChatList: (context) => const AppNavigationPage(index: 1),
      routerGroupDetail: (context) => const AppNavigationPage(),
      routerGroupMemberDetail: (context) => const AppNavigationPage(),
      routerContact: (context) => const AppNavigationPage(index: 2),
      routerDiscovery: (context) => const AppNavigationPage(index: 3),
      routerAccount: (context) => const AppNavigationPage(index: 4),
      routerSetBackground: (context) => const AppNavigationPage(),
    };
