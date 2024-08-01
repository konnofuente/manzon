import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/app_binding.dart';
import 'package:manzon/app/core/helpers/keyboard.dart';
import 'package:manzon/app/config/theme/app_theme.dart';
import 'package:manzon/app/core/utils/screen_util.dart';
import 'package:manzon/app/config/routes/app_routes.dart';
import 'package:manzon/app/config/lang/translations.dart';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';

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
    return ConnectionNotifier(
      connectionNotificationOptions: ConnectionNotificationOptions(
          connectedText: 'back_online'.tr,
          disconnectedText: 'check_connection'.tr),
      child: GestureDetector(
        onTap: () => hideKeyboard(context),
        child: GetMaterialApp(
            initialBinding: AppBindings(),
          debugShowCheckedModeBanner: false,
          title: 'Manzon',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          translations: widget.translations,
          locale: Get.deviceLocale,
          fallbackLocale: Locale('en', 'US'),
          initialRoute: AppRouteNames.associationPage,
          getPages: AppRoutes.routes
        ),
      ),
    );
  }
}
