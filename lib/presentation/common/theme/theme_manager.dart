import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  final ThemeMode _themeMode = ThemeMode.system;

  get themeMode => _themeMode;
}
