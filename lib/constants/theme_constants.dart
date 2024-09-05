import 'package:flutter/material.dart';

ColorScheme appColor([bool? isDark]) => ColorScheme.fromSeed(
    seedColor: Colors.lightBlueAccent,
    brightness: isDark == null
        ? Brightness.light
        : isDark
            ? Brightness.dark
            : Brightness.light);

ThemeData appTheme(BuildContext context, {bool? isDark}) {
  ColorScheme themeColor = appColor(isDark);
  return ThemeData(
      colorScheme: themeColor,
      fontFamily: 'DMsans',
      useMaterial3: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width * 0.95, 50)),
            backgroundColor: MaterialStatePropertyAll(Colors.grey[800]),
            overlayColor:
                MaterialStatePropertyAll(Colors.grey.withOpacity(0.2)),),
      ));
}
