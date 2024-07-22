import 'package:flutter/material.dart';
import 'package:manzon/app/manzon.dart';
import 'package:manzon/app/config/translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppTranslations translations = AppTranslations();
  await translations.loadTranslations();
  runApp(ManzonApp(translations: translations));
}