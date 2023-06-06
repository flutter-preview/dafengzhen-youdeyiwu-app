import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';

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
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColorsLight.borderColor,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: const ColorScheme.dark().copyWith(),
    textTheme: GoogleFonts.ralewayTextTheme(),
  );
}
