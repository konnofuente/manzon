import 'package:flutter/material.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primaryVariant,
    hintColor: AppColors.secondary,
    backgroundColor: AppColors.background,
    scaffoldBackgroundColor: AppColors.background,
    errorColor: AppColors.error,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.background,
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onBackground: AppColors.onBackground,
      onSurface: AppColors.onSurface,
      onError: AppColors.onError,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primaryVariant,
    hintColor: AppColors.secondary,
    backgroundColor: AppColors.onBackground,
    scaffoldBackgroundColor: AppColors.onBackground,
    errorColor: AppColors.error,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.onBackground,
      surface: AppColors.onSurface,
      error: AppColors.error,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onBackground: AppColors.background,
      onSurface: AppColors.surface,
      onError: AppColors.onError,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
