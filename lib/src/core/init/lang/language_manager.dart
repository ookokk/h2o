import 'package:flutter/material.dart';

class LanguageManager {
  LanguageManager._init();
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  final Locale englishLocale = const Locale('en', 'US');
  final Locale turkishLocale = const Locale('tr', 'TR');
  final Locale nederlandLocale = const Locale('nl', 'NL');
  final Locale arabicLocale = const Locale('ar', 'SA');
  final Locale germanLocale = const Locale('de', 'DE');
  final Locale spanishLocale = const Locale('es', 'ES');
  final Locale frenchLocale = const Locale('fr', 'FR');
  final Locale japaneseLocale = const Locale('ja', 'JP');
  final Locale portugueseLocale = const Locale('pt', 'BR');
  final Locale chineseLocale = const Locale('zh', 'CN');
  final Locale russianLocale = const Locale('ru', 'RU');

  Locale _currentLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [
        englishLocale,
        turkishLocale,
        nederlandLocale,
        arabicLocale,
        germanLocale,
        spanishLocale,
        frenchLocale,
        japaneseLocale,
        chineseLocale,
        russianLocale,
        portugueseLocale
      ];

  Locale get currentLocale => _currentLocale;

  void setLocale(Locale newLocale) {
    if (supportedLocales.contains(newLocale)) {
      _currentLocale = newLocale;
    } else {
      _currentLocale = turkishLocale;
    }
  }
}
