import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';
import 'package:manzon/app/core/utils/constants/value_manager.dart';
import 'package:manzon/infrastructure/services/local_storage_service.dart';

class SplashController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final LocalStorageService _localStorageService = Get.find();

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  Future<void> _checkAuthStatus() async {
    User? firebaseUser = _firebaseAuth.currentUser;
    UserEntity? localUser = await _localStorageService.getUser();

    if (firebaseUser == null || localUser == null) {
      Get.offAllNamed(AppRouteNames.onboarding);
    } else {
      Get.offAllNamed(AppRouteNames.home);
    }
  }

  void startTimer() {
    Timer(const Duration(seconds: DurationConstant.s2), () {
      _checkAuthStatus();
    });
  }
}
