import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(brightness: Brightness.light, textTheme: pacamaraTextTheme);

ThemeData darkTheme = ThemeData(brightness: Brightness.dark, textTheme: pacamaraTextTheme);

extension PacamaraColorTheme on ThemeData {
  Color get pacaAccent300 => brightness == Brightness.light ? const Color(0xFFF3DAD8) : const Color(0xFF37302E);
  Color get pacaAccent500 => const Color(0xFFEF4B3F);
  Color get pacaBlack => brightness == Brightness.light ? const Color(0xFFF0F0F0) : const Color(0xFF151515);
  Color get pacaWhite => brightness == Brightness.light ? const Color(0xFF151515) : const Color(0xFFF0F0F0);
  Color get pacaGray200 => brightness == Brightness.light ? const Color(0xFFD8D8D8) : const Color(0xFF363636);
  Color get pacaGray600 => brightness == Brightness.light ? const Color(0xFFA0A0A1) : const Color(0xFF616161);
  Color get pacaGray800 => brightness == Brightness.light ? const Color(0xFF222222) : const Color(0xFFC4C4C4);
}

const TextTheme pacamaraTextTheme = TextTheme(
  titleMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 17,
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 13,
    fontWeight: FontWeight.w400,
  ),
);
