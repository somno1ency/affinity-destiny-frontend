part of '../main.dart';

Map<String, WidgetBuilder> get routeMap => {
      routerMain: (context) => AppNavigationPage(
            args: ModalRoute.of(context)!.settings.arguments != null
                ? ModalRoute.of(context)!.settings.arguments as NavigationArgs
                : NavigationArgs(
                    index: 0,
                    args0: AppLocalizations.of(context)!.navMenu_singleChat,
                    args1: AppLocalizations.of(context)!.navMenu_groupChat,
                    args2: ContactCategory(
                      title: AppLocalizations.of(context)!.navMenu_contact,
                      type: ContactType.custom,
                    ),
                    args3: AppLocalizations.of(context)!.navMenu_discovery,
                    args4: AppLocalizations.of(context)!.navMenu_account,
                  ),
          ),
      routerStart: (context) => const AppStartPage(),
      routerRegisterStart: (context) => const RegisterPage(),
      routerRegisterCode: (context) => const RegisterCodePage(),
      routerLoginByPhone: (context) => const LoginByPhonePage(),
      routerLoginCode: (context) => const LoginCodePage(),
      routerLoginByPassword: (context) => const LoginByPasswordPage(),
      routerSingleChat: (context) => const ChatPage(),
      // routerSingleDetail: (context) =>
      //     const AppNavigationPage(args: args),
      // routerSingleSearch: (context) =>
      //     const AppNavigationPage(args: args),
      // routerGroupChat: (context) => const GroupPage(),
      // routerGroupDetail: (context) =>
      //     const AppNavigationPage(args: args),
      // routerGroupMemberDetail: (context) =>
      //     const AppNavigationPage(args: args),
    };
