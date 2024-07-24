import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/manzon.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:manzon/app/config/lang/translations.dart';
import 'package:manzon/app/services/connectivity_service.dart';
import 'package:manzon/infrastructure/firebase/firebase_options.dart';


void initServices() {
  Get.put(() => ConnectivityService().onInit());
  // Get.put<ConnectivityService>(ConnectivityService());

}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   initServices();
  final AppTranslations translations = AppTranslations();
  await translations.loadTranslations();
  runApp(ManzonApp(translations: translations));
}
