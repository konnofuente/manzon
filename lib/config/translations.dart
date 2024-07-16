import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppTranslations extends Translations {
  Map<String, Map<String, String>> _translations = {};

  Future<void> loadTranslations() async {
    final enJson = await rootBundle.loadString('lib/presentation/resources/translations/en.json');
    final frJson = await rootBundle.loadString('lib/presentation/resources/translations/fr.json');

    _translations = {
      'en_US': Map<String, String>.from(json.decode(enJson)),
      'fr_FR': Map<String, String>.from(json.decode(frJson)),
    };
  }

  @override
  Map<String, Map<String, String>> get keys => _translations;
}
