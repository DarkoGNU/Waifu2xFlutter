import 'package:flutter/material.dart';

const Color iconColor = Colors.lightBlue;

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.pink,
    primary: Colors.pink,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);
