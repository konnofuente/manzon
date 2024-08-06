import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/manzon.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:manzon/app/config/firebase_options.dart';
import 'package:manzon/app/config/lang/translations.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:manzon/app/services/connectivity_service.dart';
void initServices() {
  Get.lazyPut(() => ConnectivityService());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );
  initServices();
  final AppTranslations translations = AppTranslations();
  await translations.loadTranslations();
  runApp(ManzonApp(translations: translations));
}
