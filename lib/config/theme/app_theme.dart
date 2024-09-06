import 'package:flutter/material.dart';
import 'package:flutter_weather/config/colors/app_color.dart';
import 'package:flutter_weather/config/typography/app_typography.dart';

final lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColor.primary,
    onPrimary: Colors.black,
    secondary: AppColor.secondary,
    onSecondary: Colors.black,
    error: AppColor.error,
    onError: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
  textTheme: lightTextTheme,
);

final darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColor.primary,
    onPrimary: Colors.white,
    secondary: AppColor.secondary,
    onSecondary: Colors.white,
    error: AppColor.error,
    onError: Colors.white,
    surface: Colors.black,
    onSurface: Colors.white,
  ),
  textTheme: darkTextTheme,
);
