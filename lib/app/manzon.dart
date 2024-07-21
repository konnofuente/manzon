import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/config/app_routes.dart';
import 'package:manzon/config/translations.dart';
import 'package:manzon/presentation/utils/screen_util.dart';
import 'package:manzon/presentation/utils/theme/app_theme.dart';
import 'package:manzon/presentation/utils/constants/app_route_names.dart';

class ManzonApp extends StatelessWidget {
  final AppTranslations translations;

  ManzonApp({required this.translations});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return GetMaterialApp(
      title: 'Manzon',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      translations: translations,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      initialRoute: AppRouteNames.splash,
      getPages: AppRoutes.routes,
    );
  }
}
