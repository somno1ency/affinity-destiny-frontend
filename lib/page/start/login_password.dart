import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';

import '../../component/start/start_app_bar.dart';
import '../../component/start/start_body_skeleton.dart';
import '../../component/shared/radius_input.dart';
import '../../component/shared/go_step.dart';

class LoginByPasswordPage extends StatefulWidget {
  const LoginByPasswordPage({super.key});

  @override
  State<LoginByPasswordPage> createState() => _LoginByPasswordPageState();
}

class _LoginByPasswordPageState extends State<LoginByPasswordPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double stepPadding = (MediaQuery.of(context).size.width - 300) * 0.5 - 10;
    stepPadding = stepPadding > 0 ? stepPadding : 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: StartAppBar(
        title: AppLocalizations.of(context)!.start_signIn,
        callback: () {},
      ),
      body: StartBodySkeleton(
        tips: AppLocalizations.of(context)!.start_signIn,
        body: Column(
          children: [
            RadiusInput(
              sideWidth: 50,
              bodyWidth: 200,
              height: 50,
              radius: 40,
              leftPart: Center(
                child: Text(
                  AppLocalizations.of(context)!.login_phone,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
              rightPart: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Ionicons.help_circle_outline,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
              hintText: AppLocalizations.of(context)!.register_phoneTips,
            ),
            const SizedBox(height: 10),
            RadiusInput(
              sideWidth: 50,
              bodyWidth: 200,
              height: 50,
              radius: 40,
              leftPart: Center(
                child: Text(
                  AppLocalizations.of(context)!.login_password,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
              rightPart: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Ionicons.eye_off_outline,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
              hintText: AppLocalizations.of(context)!.login_passwordHereTips,
            ),
            Container(
              padding: EdgeInsets.only(
                left: stepPadding,
                top: 10,
              ),
              child: GoStep(
                tips: AppLocalizations.of(context)!.login_phoneTips,
                icon: EvaIcons.arrowCircleRight,
                callback: () {},
              ),
            ),
          ],
        ),
        iconButton: IconButton(
          onPressed: () {},
          icon: Icon(
            EvaIcons.arrowCircleRight,
            color: Theme.of(context).primaryColor,
            size: 80,
          ),
        ),
        animation: _animation,
      ),
    );
  }
}
