import 'dart:async';
import 'package:get/get.dart';
import 'package:manzon/presentation/utils/constants/value_manager.dart';
import 'package:manzon/presentation/utils/constants/app_route_names.dart';

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
