import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';

class CoreLocalizations {
  static final Map<String, dynamic> _localizedStrings = {};

  static Future<void> load(Locale locale) async {
    final langCode = locale.languageCode;
    final countryCode = locale.countryCode;
    final localeKey = countryCode != null ? '$langCode-$countryCode' : langCode;

    final String jsonString = await rootBundle.loadString(
      'assets/translations/$localeKey.json',
    );

    _localizedStrings.clear();
    _localizedStrings.addAll(json.decode(jsonString));
  }

  static String get(String key) {
    return _localizedStrings[key] ?? key;
  }

  static String tryGet(String key, {String fallback = ''}) {
    return _localizedStrings[key] ?? fallback;
  }
}
