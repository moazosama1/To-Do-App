import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool isArabic = false;
  String initialLanguage = "en";
  List<String> listLang = ["en", "ar"];
  List<String> listTheme = ["light", "dark"];
  final SharedPreferences prefsLocale;
  final SharedPreferences prefsTheme;

  ThemeProvider({required this.prefsLocale, required this.prefsTheme}) {
    readSaveTheme();
    readSaveLocale();
  }
  void funThemeData(String? value) {
    if (value == listTheme[0]) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
    saveTheme();
  }
  void readSaveTheme() async {
    var isDark = prefsTheme.getBool(Constant.isDarkTheme) ?? false;
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  }
  void saveTheme() async {
    prefsTheme.setBool(Constant.isDarkTheme, themeMode == ThemeMode.dark);
  }
  void funLanguage(String? value, BuildContext context) {
    if (value == listLang[0]) {
      initialLanguage = "en";
      context.setLocale(Locale(initialLanguage));
    } else {
      initialLanguage = "ar";
      context.setLocale(Locale(initialLanguage));
    }
    notifyListeners();
    saveLocale();
  }
  void saveLocale() async {
    prefsLocale.setString(Constant.local, initialLanguage);
  }
  void readSaveLocale() async {
    initialLanguage = prefsLocale.getString(Constant.local) ?? 'en';
  }
}

class Constant {
  static const String local = "lang";
  static const String isDarkTheme = "theme";
  static const String onboarding = 'onboarding_key';
}
