import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../l10n/messages_all.dart';

class AppLocalization {
  static Future<AppLocalization> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalization();
    });
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  // list of locales
  String get changeLang {
    return Intl.message(
      'Change language',
      name: 'changeLang',
      desc: 'Simpel word for greeting ',
    );
  }
  String get enLangButton {
    return Intl.message(
      'English',
      name: 'enLangButton',
      desc: 'Simpel word for greeting ',
    );
  }
  String get ruLangButton {
    return Intl.message(
      'Russian',
      name: 'ruLangButton',
      desc: 'Simpel word for greeting ',
    );
  }
  String get armLangButton {
    return Intl.message(
      'Armenian',
      name: 'armLangButton',
      desc: 'Simpel word for greeting ',
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  final Locale overriddenLocale;

  const AppLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => ['en', 'ru', 'arm'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}
