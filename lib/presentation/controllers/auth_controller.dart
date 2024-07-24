import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manzon/presentation/widgets/toast_utils.dart';
import 'package:manzon/app/services/connectivity_service.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';
import 'package:manzon/domain/usecases/auth/verify_phone_number_use_case.dart';
import 'package:manzon/domain/usecases/auth/sign_in_with_phone_number_use_case.dart';

class AuthentificationController extends GetxController {
  final VerifyPhoneNumberUseCase _verifyPhoneNumberUseCase;
  final SignInWithPhoneNumberUseCase _signInWithPhoneNumberUseCase;
  final ConnectivityService connectivityService = Get.find();
  var verificationId = ''.obs;

  AuthentificationController(
      this._verifyPhoneNumberUseCase, this._signInWithPhoneNumberUseCase);

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    bool isConnected = await connectivityService.checkConnectivity();

    if (!isConnected) {
      ToastUtils.showError(
        Get.context!,
        "No Internet Connection",
        "Please check your connection and try again.",
      );
      return;
    }


    await _verifyPhoneNumberUseCase.call(
      phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await signInWithPhoneAuthCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        ToastUtils.showError(
            Get.context!, 'Verification Failed', e.message ?? 'Unknown error');
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        Get.toNamed(AppRouteNames.otp);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<void> signInWithOtp(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId.value,
      smsCode: otp,
    );
    await signInWithPhoneAuthCredential(credential);
  }

  Future<void> signInWithPhoneAuthCredential(
      PhoneAuthCredential credential) async {
    await _signInWithPhoneNumberUseCase.call(credential);
  }
}
