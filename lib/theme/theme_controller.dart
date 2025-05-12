import 'package:flutter/material.dart';

class ThemeController {
  static final ThemeController instance = ThemeController._();
  ThemeController._();

  final themeMode = ValueNotifier(ThemeMode.light);

  void toggleTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
