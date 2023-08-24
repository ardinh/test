import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_us.dart';
import 'in_id.dart';

class TranslationService extends Translations {
  //static Locale? get locale => Get.deviceLocale;
  static const locale = Locale('id', 'ID');
  static const fallbackLocale = Locale('en', 'US');

  static final langs = [
    'English',
    'Bahasa',
  ];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('id', 'ID'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'id_ID': inID,
      };

  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale ?? fallbackLocale;
  }
}
