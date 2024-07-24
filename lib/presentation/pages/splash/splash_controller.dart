import 'dart:async';
import 'package:get/get.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';
import 'package:manzon/app/core/utils/constants/value_manager.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: DurationConstant.s3), () {
      Get.offNamed(AppRouteNames.onboarding);
    });
  }
}
