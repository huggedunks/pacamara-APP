import 'package:flutter/material.dart';
import 'package:pacamara_app/presentation/common/theme/theme_constants.dart';
import 'package:pacamara_app/presentation/common/theme/theme_manager.dart';
import 'package:pacamara_app/presentation/memo_list/view/memo_list_view.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacamara Note',
      themeMode: themeManager.themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MemoListView(),
    );
  }
}
