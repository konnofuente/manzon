import 'package:flutter/material.dart';
import 'package:manzon/presentation/utils/theme/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryNormal,
    primaryColorDark: AppColors.primaryDarker,
    hintColor: AppColors.secondaryNormal,
    backgroundColor: AppColors.secondaryLight,
    scaffoldBackgroundColor: AppColors.secondaryLight,
    errorColor: AppColors.blackDarker,
    colorScheme: ColorScheme.light(
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
    backgroundColor: AppColors.blackDark,
    scaffoldBackgroundColor: AppColors.blackDark,
    errorColor: AppColors.blackDarker,
    colorScheme: ColorScheme.dark(
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
