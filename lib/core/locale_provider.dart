  import 'package:flutter/material.dart';

  class LocaleProvider extends ChangeNotifier {
    Locale _locale = const Locale('tr');

    Locale get locale => _locale;

    void setLocale(Locale locale) {
      if (!L10n.all.contains(locale)) return;
      _locale = locale;
      notifyListeners();
    }
  }

  class L10n {
    static const all = [
      Locale('en'),
      Locale('tr'),
    ];
  }
