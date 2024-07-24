import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
// ignore_for_file: deprecated_member_use


class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryNormal,
    primaryColorDark: AppColors.primaryDarker,
    hintColor: AppColors.blackLight,
    scaffoldBackgroundColor: AppColors.secondaryLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryNormal,
      secondary: AppColors.secondaryNormal,
      background: AppColors.secondaryLight,
      surface: AppColors.secondaryLight,
      error: AppColors.blackDarker,
      onPrimary: AppColors.fontLightPrimary,
      onSecondary: AppColors.fontLightSecondary,
      onBackground: AppColors.fontLightPrimary,
      onSurface: AppColors.fontLightSecondary,
      onError: AppColors.fontLightPrimary,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryNormal,
    primaryColorDark: AppColors.primaryDarker,
    hintColor: AppColors.secondaryNormal,
    scaffoldBackgroundColor: AppColors.blackDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      background: AppColors.blackDark,
      surface: AppColors.blackDark,
      error: AppColors.blackDarker,
      onPrimary: AppColors.fontLightPrimary,
      onSecondary: AppColors.fontLightSecondary,
      onBackground: AppColors.secondaryLight,
      onSurface: AppColors.secondaryLightHover,
      onError: AppColors.secondaryLightActive,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
