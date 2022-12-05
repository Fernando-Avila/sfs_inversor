import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kSupportedLanguages = [
  Locale('es', ''),
  Locale('en', ''),
  Locale('ja', '')
];

class AppLocalizations {
  final Locale _locale;
  Map<String, dynamic> _mensajes = Map();
  AppLocalizations(this._locale);

  static AppLocalizations? of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  static LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Future<void> loadMessage() async {
    String jsonMessages;
    try {
      jsonMessages = await rootBundle
          .loadString("assets/lang/${_locale.countryCode}.json");
    } catch (e) {
      print(e);
      print(_locale.countryCode);
      print(_locale.toLanguageTag());
      print(_locale.languageCode);
      jsonMessages = await rootBundle.loadString("assets/lang/en.json");
    }
    _mensajes = json.decode(jsonMessages);
  }

  String translate(String key) {
    if (_mensajes.containsKey(key)) {
      return _mensajes[key];
    } else {
      return 'Falta traduccion de { $key}';
    }
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    try {
      kSupportedLanguages
          .firstWhere((element) => element.languageCode == locale.languageCode);
      return true;
    } catch (e) {}
    return false;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale);
    await appLocalizations.loadMessage();
    return appLocalizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
