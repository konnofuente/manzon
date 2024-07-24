import 'package:get/get.dart';
import 'package:manzon/presentation/controllers/auth_controller.dart';

class OTPController extends GetxController {
  final AuthentificationController _authentificationController = Get.find();
  var otp = ''.obs;
  var isButtonEnabled = false.obs;
  var remainingTime = 30.obs;

  void setOTP(String otp) {
    this.otp.value = otp;
    isButtonEnabled.value = otp.length == 6;
  }

  void verifyOTP() {
    if (otp.value.length == 6) {
      _authentificationController.signInWithOtp(otp.value);
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
        Future.delayed(Duration(seconds: 1), () {
          remainingTime.value--;
        });
      }
    });
  }

  void resendOTP() {
    _authentificationController.resendVerificationCode();
    startTimer();
  }
}
