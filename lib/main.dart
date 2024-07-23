import 'package:flutter/material.dart';
import 'package:manzon/app/manzon.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:manzon/app/config/translations.dart';
import 'package:manzon/app/config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final AppTranslations translations = AppTranslations();
  await translations.loadTranslations();
  runApp(ManzonApp(translations: translations));
}
