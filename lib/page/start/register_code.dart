import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';

import '../../component/start/start_app_bar.dart';
import '../../component/start/start_body_skeleton.dart';
import '../../component/shared/radius_input.dart';
import '../../component/shared/go_step.dart';

class RegisterCodePage extends StatefulWidget {
  const RegisterCodePage({super.key});

  @override
  State<RegisterCodePage> createState() => _RegisterCodePageState();
}

class _RegisterCodePageState extends State<RegisterCodePage>
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
    return Scaffold(
      appBar: StartAppBar(
        title: AppLocalizations.of(context)!.start_signUp,
        callback: () {},
      ),
      body: StartBodySkeleton(
        tips: AppLocalizations.of(context)!.register_phoneCodeTips,
        body: Column(
          children: [
            GoStep(
              tips: AppLocalizations.of(context)!.register_prevStep,
              icon: Ionicons.arrow_undo_circle_outline,
              callback: () {},
            ),
            _buildRegisterCode(),
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

  Widget _buildRegisterCode() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
