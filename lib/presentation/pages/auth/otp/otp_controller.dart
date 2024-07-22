import 'package:get/get.dart';

class OTPController extends GetxController {
  var otp = ''.obs;
  var isButtonEnabled = false.obs;
  var remainingTime = 30.obs;

  void setOTP(String otp) {
    this.otp.value = otp;
    isButtonEnabled.value = otp.length == 4;
  }

  void verifyOTP() {
    if (otp.value.length == 4) {
      // Add OTP verification logic here
      print('OTP Verified: ${otp.value}');
    } else {
      print('Invalid OTP');
    }
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    remainingTime.value = 30;
    ever(remainingTime, (_) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      }
    });
  }
}
