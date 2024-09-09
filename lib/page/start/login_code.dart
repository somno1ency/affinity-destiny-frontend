import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../component/start/start_app_bar.dart';
import '../../component/start/start_body_skeleton.dart';
import '../../component/shared/go_step.dart';
import '../../shared/constant.dart';

class LoginCodePage extends StatefulWidget {
  const LoginCodePage({super.key});

  @override
  State<LoginCodePage> createState() => _LoginCodePageState();
}

class _LoginCodePageState extends State<LoginCodePage>
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
    double stepPadding =
        (MediaQuery.of(context).size.width - (48 * 6 + 10 * 5)) * 0.5 - 10;
    stepPadding = stepPadding > 0 ? stepPadding : 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: StartAppBar(
        title: AppLocalizations.of(context)!.start_signIn,
        callback: () {
          Navigator.of(context).pop();
        },
      ),
      body: StartBodySkeleton(
        tips: AppLocalizations.of(context)!.start_signIn,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: stepPadding,
                bottom: 25,
              ),
              child: GoStep(
                tips: AppLocalizations.of(context)!.register_prevStep,
                icon: EvaIcons.arrowCircleLeft,
                callback: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            _buildRegisterCode(6),
            Container(
              padding: EdgeInsets.only(
                left: stepPadding,
                top: 10,
              ),
              child: GoStep(
                tips: AppLocalizations.of(context)!.login_passwordTips,
                icon: EvaIcons.arrowCircleRight,
                callback: () {
                  Navigator.of(context).pushNamed(routerLoginByPassword);
                },
              ),
            ),
          ],
        ),
        iconButton: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(routerMain);
          },
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

  Widget _buildRegisterCode(int quantity) {
    List<Widget> widgets = [];
    for (int i = 0; i < quantity; i++) {
      widgets.add(
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            cursorColor: Theme.of(context).primaryColor,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 11),
              border: InputBorder.none,
            ),
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      );
      if (i < quantity - 1) {
        widgets.add(const SizedBox(width: 10));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...widgets,
      ],
    );
  }
}
