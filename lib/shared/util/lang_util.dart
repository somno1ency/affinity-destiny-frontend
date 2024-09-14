import 'package:pinyin/pinyin.dart';

import '../../model/component/enumeration/lang_type.dart';
import '../../shared/constant.dart';

class LangUtil {
  const LangUtil._();

  static LanguageType detectLanguage(String str) {
    if (regChinese.hasMatch(str)) {
      return LanguageType.chinese;
    } else if (regEnglish.hasMatch(str)) {
      return LanguageType.english;
    } else if (regSpecial.hasMatch(str)) {
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
        return charSpecial;
    }
  }
}
