import 'package:pinyin/pinyin.dart';

import 'package:affinity_destiny/model/enumeration/lang_type.dart';
import 'package:affinity_destiny/shared/constant.dart';

class LangUtil {
  const LangUtil._();

  static LanguageType detectLanguage(String str) {
    if (AppConstant.regChinese.hasMatch(str)) {
      return LanguageType.chinese;
    } else if (AppConstant.regEnglish.hasMatch(str)) {
      return LanguageType.english;
    } else if (AppConstant.regSpecial.hasMatch(str)) {
      return LanguageType.special;
    } else {
      return LanguageType.special;
    }
  }

  static String processLanguage(String str, LanguageType type) {
    switch (type) {
      case LanguageType.chinese:
        return PinyinHelper.getShortPinyin(str).toUpperCase();
      case LanguageType.english:
        return str.toUpperCase();
      case LanguageType.special:
        return AppConstant.charSpecial;
    }
  }
}
