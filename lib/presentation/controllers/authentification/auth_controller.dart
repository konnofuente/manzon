import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/presentation/widgets/toast_utils.dart';
import 'package:manzon/app/services/connectivity_service.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';
import 'package:manzon/presentation/controllers/user_controller.dart';
import 'package:manzon/domain/usecases/auth/verify_phone_number_use_case.dart';
import 'package:manzon/domain/usecases/auth/sign_in_with_phone_number_use_case.dart';

class AuthentificationController extends GetxController {
  final VerifyPhoneNumberUseCase _verifyPhoneNumberUseCase;
  final SignInWithPhoneNumberUseCase _signInWithPhoneNumberUseCase;
  final ConnectivityService connectivityService = Get.find();
  final UserController userController = Get.find();
  User? _user;

  var verificationId = ''.obs;
  var otp = ''.obs;
  var isButtonEnabled = false.obs;
  var remainingTime = 30.obs;
  var isLoadingButton = false.obs;

  String? phoneNumber;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  AuthentificationController(
      this._verifyPhoneNumberUseCase, this._signInWithPhoneNumberUseCase);

  @override
  void onInit() {
    super.onInit();
    phoneNumberController.addListener(() {
      phoneNumber = phoneNumberController.text;
    });
    startTimer();
  }

  void startTimer() {
    remainingTime.value = 30;
    _decrementTime();
  }

  void _decrementTime() {
    if (remainingTime.value > 0) {
      Future.delayed(Duration(seconds: 1), () {
        remainingTime.value--;
        _decrementTime();
      });
    }
  }

  Future<void> verifyPhoneNumber() async {
    if (phoneNumber == null || phoneNumber!.isEmpty) {
      ToastUtils.showError(Get.context!, "Error", "Phone number is required");
      return;
    }

    isLoadingButton.value = true;
    bool isConnected = await connectivityService.checkConnectivity();

    if (!isConnected) {
      isLoadingButton.value = false;
      ToastUtils.showError(
        Get.context!,
        "No Internet Connection",
        "Please check your connection and try again.",
      );
      return;
    }

    await _verifyPhoneNumberUseCase.call(
      phoneNumber!,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await signInWithPhoneAuthCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        isLoadingButton.value = false;
        ToastUtils.showError(
            Get.context!, 'Verification Failed', e.message ?? 'Unknown error');
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        isLoadingButton.value = false;
        Get.toNamed(AppRouteNames.otp);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  void setOTP(String otp) {
    this.otp.value = otp;
    isButtonEnabled.value = otp.length == 6;
  }

  void verifyOTP() {
    if (otp.value.length == 6) {
      signInWithOtp(otp.value);
    } else {
      ToastUtils.showError(Get.context!, "Error", "Invalid OTP");
    }
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
    try {
      UserCredential userCredential =
          await _signInWithPhoneNumberUseCase.call(credential);

      _user = userCredential.user;

      if (_user != null) {
        UserEntity userModel = UserEntity(
            name: fullNameController.text,
            id: _user!.uid,
            phoneNumber: _user!.phoneNumber!);

        userController.addUser(userModel);
        Get.offAllNamed(AppRouteNames.home);
      }
    } catch (e) {
      log('Error in signInWithPhoneAuthCredential: $e');
      ToastUtils.showError(Get.context!, 'Verification Failed', e.toString());
    }
  }

  Future<void> resendVerificationCode() async {
    if (phoneNumber != null) {
      await verifyPhoneNumber();
      startTimer();
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
