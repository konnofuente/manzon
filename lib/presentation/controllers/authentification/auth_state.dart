import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthentificationState {
  var verificationId = ''.obs;
  var otp = ''.obs;
  var isButtonEnabled = false.obs;
  var remainingTime = 30.obs;
  var isLoadingButton = false.obs;

  String? phoneNumber;

  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  AuthState() {
    phoneNumberController.addListener(() {
      phoneNumber = phoneNumberController.text;
    });
  }

  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
  }
}
