import 'package:flutter/material.dart';

ThemeData themeData=ThemeData(
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    errorBorder: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(),
    prefixIconColor: Colors.grey,
    focusedBorder: OutlineInputBorder(),
    disabledBorder: OutlineInputBorder(),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(

      backgroundColor: Colors.red,
      textStyle: const TextStyle(
        fontSize: 18,
      ),
      disabledBackgroundColor: Colors.grey
    ),
  ),
);
OutlineInputBorder outlineInputBorder=const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey
  )
);