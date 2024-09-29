import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:affinity_destiny/lang/zh_cn.dart';
import 'package:affinity_destiny/lang/en_US.dart';

class TranslationService extends Translations {
  static Locale? get locale => const Locale('en', 'US');
  static const fallbackLocale = Locale('zh', 'CN');

  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zh_CN,
        'en_US': en_US,
      };
}
