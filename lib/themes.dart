import 'package:flutter/material.dart';

TextTheme textTheme(BuildContext context, [double sizeDelta = 2.0]) {
  return Theme.of(context).textTheme.apply(fontSizeDelta: 2.0);
}

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pink,
      primary: Colors.pink,
    ),
    textTheme: textTheme(context),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
    ),
  );
}

Color iconColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return Colors.lightBlue;
  }

  return Colors.red; // TODO: pick a color for dark theme
}
