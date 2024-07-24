import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/manzon.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:manzon/app/config/lang/translations.dart';
import 'package:manzon/app/services/connectivity_service.dart';
import 'package:manzon/app/config/firebase/firebase_options.dart';
import 'package:manzon/domain/usecases/auth/verify_phone_number_use_case.dart';
import 'package:manzon/infrastructure/data_sources/firebase/auth_data_source.dart';
import 'package:manzon/domain/usecases/auth/sign_in_with_phone_number_use_case.dart';
import 'package:manzon/presentation/controllers/authentification/auth_controller.dart';
import 'package:manzon/infrastructure/repositories/auth_repository_implementation.dart';

void initServices() {
  Get.lazyPut(() => ConnectivityService());

  final _authenticationDataSource = AuthenticationDataSource();
  final authRepositoryImp =
      AuthenticationRepositoryImpl(_authenticationDataSource);

  Get.lazyPut<AuthentificationController>(() => AuthentificationController(
      VerifyPhoneNumberUseCase(authRepositoryImp),
      SignInWithPhoneNumberUseCase(authRepositoryImp)));
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
