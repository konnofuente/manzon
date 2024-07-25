import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryNormal,
    primaryColorDark: AppColors.primaryDarker,
    hintColor: AppColors.blackLight,
    scaffoldBackgroundColor: AppColors.secondaryLight,
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryNormal,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.fontLightPrimary, fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: AppColors.fontLightPrimary, fontSize: 28, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(color: AppColors.fontLightPrimary, fontSize: 24, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(color: AppColors.fontLightPrimary, fontSize: 22, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: AppColors.fontLightPrimary, fontSize: 20, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(color: AppColors.fontLightPrimary, fontSize: 18, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: AppColors.fontLightPrimary, fontSize: 16, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: AppColors.fontLightPrimary, fontSize: 14, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: AppColors.fontLightPrimary, fontSize: 12, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: AppColors.fontLightPrimary, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.fontLightSecondary, fontSize: 14),
      bodySmall: TextStyle(color: AppColors.fontLightSecondary, fontSize: 12),
      labelLarge: TextStyle(color: AppColors.fontLightPrimary, fontSize: 14, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(color: AppColors.fontLightPrimary, fontSize: 12, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(color: AppColors.fontLightPrimary, fontSize: 10, fontWeight: FontWeight.bold),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryNormal,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondaryLight,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.borderLight),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryNormal),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryNormal,
      secondary: AppColors.secondaryNormal,
      background: AppColors.secondaryLight,
      surface: AppColors.secondaryLight,
      error: AppColors.error,
      onPrimary: AppColors.fontLightPrimary,
      onSecondary: AppColors.fontLightSecondary,
      onBackground: AppColors.fontLightPrimary,
      onSurface: AppColors.fontLightSecondary,
      onError: AppColors.fontLightPrimary,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDark,
    primaryColorDark: AppColors.primaryDarker,
    hintColor: AppColors.secondaryNormal,
    scaffoldBackgroundColor: AppColors.blackDark,
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryDark,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.fontDarkPrimary, fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: AppColors.fontDarkPrimary, fontSize: 28, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(color: AppColors.fontDarkPrimary, fontSize: 24, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(color: AppColors.fontDarkPrimary, fontSize: 22, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: AppColors.fontDarkPrimary, fontSize: 20, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(color: AppColors.fontDarkPrimary, fontSize: 18, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: AppColors.fontDarkPrimary, fontSize: 16, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: AppColors.fontDarkPrimary, fontSize: 14, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: AppColors.fontDarkPrimary, fontSize: 12, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: AppColors.fontDarkPrimary, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.fontDarkSecondary, fontSize: 14),
      bodySmall: TextStyle(color: AppColors.fontDarkSecondary, fontSize: 12),
      labelLarge: TextStyle(color: AppColors.fontDarkPrimary, fontSize: 14, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(color: AppColors.fontDarkPrimary, fontSize: 12, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(color: AppColors.fontDarkPrimary, fontSize: 10, fontWeight: FontWeight.bold),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryDark,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.blackDark,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.borderLight),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryDark),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      background: AppColors.blackDark,
      surface: AppColors.blackDark,
      error: AppColors.error,
      onPrimary: AppColors.fontDarkPrimary,
      onSecondary: AppColors.fontDarkSecondary,
      onBackground: AppColors.fontDarkPrimary,
      onSurface: AppColors.fontDarkSecondary,
      onError: AppColors.fontDarkPrimary,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
