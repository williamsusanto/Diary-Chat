import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const primary = Color(0xFF8A89D1);
  static const secondary = Color(0xFFB7B6F1);
  static const accent = Color(0xFFD6755B);
  static const textDark = Color(0xFF000000);
  static const textLight = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = primary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

/// Reference to the application theme.
abstract class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
        primaryColorDark: AppColors.textDark,
        brightness: Brightness.light,
        accentColor: accentColor,
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.mulishTextTheme().apply(bodyColor: AppColors.textDark),
        backgroundColor: _LightColors.background,
        scaffoldBackgroundColor: _LightColors.background,
        cardColor: _LightColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textDark),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconDark),
      );

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData(
        primaryColorLight: AppColors.textLight,
        brightness: Brightness.dark,
        accentColor: accentColor,
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.interTextTheme().apply(bodyColor: AppColors.textLight),
        backgroundColor: _DarkColors.background,
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textLight),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconLight),
      );
}
