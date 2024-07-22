import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/helpers/keyboard.dart';
import 'package:manzon/app/config/app_routes.dart';
import 'package:manzon/app/config/translations.dart';
import 'package:manzon/presentation/utils/screen_util.dart';
import 'package:manzon/presentation/utils/theme/app_theme.dart';
import 'package:manzon/presentation/utils/constants/app_route_names.dart';

class ManzonApp extends StatefulWidget {
  final AppTranslations translations;

  ManzonApp({required this.translations});

  @override
  State<ManzonApp> createState() => _ManzonAppState();
}

class _ManzonAppState extends State<ManzonApp> {
   
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Manzon',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        translations: widget.translations,
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en', 'US'),
        initialRoute: AppRouteNames.userRole,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
