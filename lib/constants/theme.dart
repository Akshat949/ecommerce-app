import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff23d48e),
      textStyle: const TextStyle(
        fontSize: 20,
         fontWeight: FontWeight.bold
      ),
      disabledBackgroundColor: Colors.grey,
    ),
  ),
);
