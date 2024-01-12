import 'package:flutter/material.dart';
 import 'package:shared_preferences/shared_preferences.dart';

import 'localizations.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String KURDISH = 'ku';
const String ARABIC = 'ar';



Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale('en');
    case KURDISH:
      return Locale('ku');
    case ARABIC:
      return Locale('ar');
    default:
      return Locale('en');
  }
}

String getTranslated(BuildContext context, String key) {
  return AppLocalizations.of(context)!.translate(key);
}