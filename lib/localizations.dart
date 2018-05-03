import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ReduxLocalizations {
  Locale locale;
  ReduxLocalizations(this.locale);

  static ReduxLocalizations of(BuildContext context) {
    return Localizations.of<ReduxLocalizations>(
      context,
      ReduxLocalizations,
    );
  }

  String get appTitle => "Redux Example";

  String get todos => Intl.message(
        'Todos',
        name: 'todos',
        args: [],
        locale: locale.toString(),
      );

  String get stats => Intl.message(
        'Stats',
        name: 'stats',
        args: [],
        locale: locale.toString(),
      );
}

class ReduxLocalizationsDelegate
    extends LocalizationsDelegate<ReduxLocalizations> {
  @override
  Future<ReduxLocalizations> load(Locale locale) =>
     new Future(() => new ReduxLocalizations(locale));

  @override
  bool shouldReload(ReduxLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains("en");
}
