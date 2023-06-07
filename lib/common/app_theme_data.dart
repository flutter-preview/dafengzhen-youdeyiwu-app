import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';

/// AppThemeData
class AppThemeData {
  AppThemeData._();

  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColorsLight.color4,
        secondary: AppColorsLight.color3,
        tertiary: AppColorsLight.color2,
        background: AppColorsLight.backgroundColor,
      ),
      textTheme: GoogleFonts.ralewayTextTheme(),
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorsLight.borderColor,
          ),
        ),
      ),
      snackBarTheme: const SnackBarThemeData().copyWith(
        backgroundColor: AppColorsLight.alertDangerBackgroundColor,
        contentTextStyle: const TextStyle(
          color: AppColorsLight.alertDangerColor,
        ),
      ));

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: const ColorScheme.dark().copyWith(),
    textTheme: GoogleFonts.ralewayTextTheme(),
  );
}
